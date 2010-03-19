import org.codehaus.groovy.grails.plugins.springsecurity.Secured
import labmaster.auth.Member
import labmaster.auth.Role

/**
 * User controller.
 */
class MemberController {

	def authenticateService

	// the delete, save and update actions only accept POST requests
	static Map allowedMethods = [delete: 'POST', save: 'POST', update: 'POST']

	def index = {
            def user  = authenticateService.userDomain()
            if(user.doesInAdminRole())
		redirect action: list, params: params
            else
                redirect action: show, params: params, id: user.id
	}

        @Secured(['ROLE_ADMIN'])
	def list = {
		if (!params.max) {
			params.max = 10
		}
		[personList: Member.list(params)]
	}

	def show = {
            def u = authenticateService.userDomain()

            if(u.doesInAdminRole() || u.doesUserSelf(params.int('id'))) {
		def person = Member.get(params.id)
		if (!person) {
			flash.message = "没有找到对应的用户"
			redirect action: list
			return
		}
		List roleNames = []
		for (role in person.authorities) {
			roleNames << role.description
		}
		roleNames.sort { n1, n2 ->
			n1 <=> n2
		}
		[person: person, roleNames: roleNames]
            } else 
                redirect controller:'login', action:'denied'
	}

	/**
	 * 删除用户--禁止删除用户，改为禁用
	 */
        @Secured(['ROLE_ADMIN'])
	def delete = {	
		/* {{{
		def person = Member.get(params.id)
		if (person) {
			def authPrincipal = authenticateService.principal()
			//avoid self-delete if the logged-in user is an admin
			if (authPrincipal && !(authPrincipal instanceof String) && authPrincipal.username == person.username) {
				flash.message = "You can not delete yourself, please login as another admin and try again"
			}
			else {
				//first, delete this person from People_Authorities table.
				Role.findAll().each { it.removeFromPeople(person) }
				person.delete()
				flash.message = "Member $params.id deleted."
			}
		}
		else {
			flash.message = "Member not found with id $params.id"
		}
                }}} */
		
		def person = Member.get(params.id)
		if (person) {
			def authPrincipal = authenticateService.principal()
			//avoid self-delete if the logged-in user is an admin
			if (authPrincipal && !(authPrincipal instanceof String) && authPrincipal.username == person.username) {
				flash.message = "You can not delete yourself, please login as another admin and try again"
			}
			else {
				//first, delete this person from People_Authorities table.
				person.enabled = 0
				person.save()
				flash.message = "为了保证数据的完整性，系统不允许删除用户，但是该用户已被禁用!"
			}
		}
		else {
			flash.message = "找不到序号是$params.id的用户！"
		}
		
		redirect action: list
	}

    @Secured(['IS_AUTHENTICATED_FULLY'])
	def edit = {
        def u = authenticateService.userDomain()
        if(u.doesInAdminRole() || u.doesUserSelf(params.int('id'))) {

            def person = Member.get(params.id)
            if (!person) {
                flash.message = "没有找到对应的用户"
                    redirect action: index
                    return
            }

            return buildPersonModel(person)
        } else 
            redirect action: index
    }

	/**
	 * Person update action.
	 */
    @Secured(['IS_AUTHENTICATED_FULLY'])
	def update = {
        def u = authenticateService.userDomain()
        boolean isAdmin = u.doesInAdminRole()
        if(isAdmin || u.doesUserSelf(params.int('id'))) {

            def person = Member.get(params.id)
            if (!person) {
                flash.message = "Member not found with id $params.id"
                redirect action: edit, id: params.id
                return
            }

            long version = params.version.toLong()
            if (person.version > version) {
                person.errors.rejectValue 'version', "person.optimistic.locking.failure",
                    "Another user has updated this Member while you were editing."
                    render view: 'edit', model: buildPersonModel(person)
                return
            }

            def oldPassword = person.passwd

            bindData(person, params, ['id', 'username', 'password'])
            
            if (person.save()) {
                // 管理员的修改才修改权限
                if(isAdmin) {
                    Role.findAll().each { it.removeFromPeople(person) }
                    addRoles(person)
                }
                redirect action: show, id: person.id
            }
            else {
                render view: 'edit', model: buildPersonModel(person)
            }
        } else 
            redirect action: index
	}

    @Secured(['ROLE_ADMIN'])
	def create = {
		[person: new Member(params), authorityList: Role.list()]
	}

    @Secured(['IS_AUTHENTICATED_FULLY'])
	def password = {
        def person = Member.get(params.id)
        if(!person)
            redirect action: index
        else
            [person: person]
	}

    @Secured(['IS_AUTHENTICATED_FULLY'])
	def updatePasswd = {PasswordCommand cmd ->
        def u = authenticateService.userDomain()

        // 只有自己才能修改自己的密码
        if(u.doesUserSelf(params.int('id')))
        {
            def person = Member.get(params.int('id')) 
            if(person) {
                String oldPassword = person.passwd

                cmd.oldPassword = authenticateService.encodePassword(params.oldPassword)
                if(cmd.oldPassword != oldPassword) {
                    cmd.errors.rejectValue 'oldPassword', "passwordCommand.oldPassword.wrongPassword" 
                }

                if(params.captcha.toUpperCase() != session.captcha) {
                    cmd.errors.rejectValue 'captcha', "passwordCommand.captcha.differentCapcha" 
                }

                params.passwd = authenticateService.encodePassword(params.passwd)
                bindData(person, params, [include:['passwd']])

                boolean valid = true
                valid = valid && person.validate()
                valid = valid && !person.hasErrors()
                valid = valid && !cmd.hasErrors()

                if(valid) {
                    if(person.save(flush:true)) {
                        flash.message = '成功修改了密码'
                            redirect action:show, params:params
                            return
                    } 
                } else {
                    person.discard()
                }
            }
            render view: 'password', model: [person:person,cmd:cmd]
        } else {
            flash.message = '只能修改本人的密码！'
            redirect action:show, params:params
        }
	}
	/**
	 * Person save action.
	 */
    @Secured(['ROLE_ADMIN'])
	def save = {

		def person = new Member()
		person.properties = params
		person.passwd = authenticateService.encodePassword(params.passwd)
		
		if (person.save()) {
			addRoles(person)
			redirect action: show, id: person.id
		}
		else {
			render view: 'create', model: [authorityList: Role.list(), person: person]
		}
	}

	private void addRoles(person) {
		for (String key in params.keySet()) {
			if (key.contains('ROLE') && 'on' == params.get(key)) {
				Role.findByAuthority(key).addToPeople(person)
			}
		}
	}

	private Map buildPersonModel(person) {

		List roles = Role.list()
		roles.sort { r1, r2 ->
			r1.authority <=> r2.authority
		}
		Set userRoleNames = []
		for (role in person.authorities) {
			userRoleNames << role.authority
		}
		LinkedHashMap<Role, Boolean> roleMap = [:]
		for (role in roles) {
			roleMap[(role)] = userRoleNames.contains(role.authority)
		}

		return [person: person, roleMap: roleMap]
	}
}

class PasswordCommand {
    String oldPassword
    String passwordAgain
    String passwd
    String captcha

    static constraints = {
        passwd(length:6..32,blank:false)
        passwordAgain(validator: {
            val, obj->
            if(!val || !obj.passwd || obj.passwd != val)
                return 'differentPassword'
        })
    }
}

/*
vim600: ts=4 st=4 foldmethod=marker foldmarker={{{,}}} syn=groovy 
vim600: encoding=utf-8 
*/
