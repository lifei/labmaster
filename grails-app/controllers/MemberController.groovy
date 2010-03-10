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
		redirect action: list, params: params
	}

	def list = {
		if (!params.max) {
			params.max = 10
		}
		[personList: Member.list(params)]
	}

	def show = {
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
	}

	/**
	 * 删除用户--禁止删除用户，改为禁用
	 */
	def delete = {	
		/*
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
		*/
		
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

	def edit = {

		def person = Member.get(params.id)
		if (!person) {
			flash.message = "没有找到对应的用户"
			redirect action: list
			return
		}

		return buildPersonModel(person)
	}

	/**
	 * Person update action.
	 */
	def update = {

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
		person.properties = params
		
		// 密码不在update里面处理
		if (params.passwd && !params.passwd.equals(oldPassword)) {
			person.passwd = authenticateService.encodePassword(params.passwd)
		}
		if (person.save()) {
			Role.findAll().each { it.removeFromPeople(person) }
			addRoles(person)
			redirect action: show, id: person.id
		}
		else {
			render view: 'edit', model: buildPersonModel(person)
		}
	}

	def create = {
		[person: new Member(params), authorityList: Role.list()]
	}

	/**
	 * Person save action.
	 */
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
