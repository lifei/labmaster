package labmaster.auth

import labmaster.auth.Role

/**
 * User domain class.
 */
class Member {

    /* 实体定义{{{*/
	/** Username */
	String username
	/** User Real Name*/
	String userRealName
	/** MD5 Password */
	String passwd
	/** enabled */
	boolean enabled = false

	String email
	boolean emailShow

	/** description */
	String description = ''

	static transients = ['pass','currentUser']
	/** plain password to create a MD5 password */
	String pass = '[secret]'

	static constraints = {
		username(size:4..32,blank: false, unique: true)
		userRealName(blank: false)
		passwd(blank: false)
		enabled()
	}

	static hasMany = [authorities: Role]
	static belongsTo = Role
/*}}}*/
    /*静态函数{{{*/
    static def getCurrentUser() {
        org.grails.plugins.springsecurity.service.AuthenticateService authenticateService = new org.grails.plugins.springsecurity.service.AuthenticateService()

        def user = authenticateService.userDomain()
        if (user) {
            return Member.get(user.id)
        }
        else {
            return null
        }
    }
    /*}}}*/
	String toString() {
		"${userRealName} (${username})"
	}
    /*群组相关的属性和方法{{{*/

    /** 是否是管理员组 */

    boolean InAdminRole() {

    }

    boolean doesInAdminRole() {
        return this.doesInRole('ROLE_ADMIN')
    }

    boolean doesInRole(String role) {
        return this.authorities.any{it.authority == role}
    }

    boolean doesUserSelf(def id) {
        try {
            if(id) {
                if(id instanceof String) {
                    return this.id == Integer.valueOf(id)
                }
                return this.id == (id as Integer)
            }
        } catch(e) { }

        return false
    }
    /*}}}*/
    /*{{{*/
    boolean equals(Member m) {
        m.id == this.id
    }

    boolean compareTo(Member m) {
        m.id == this.id
    }/*}}}*/
}

//vim600: ts=4 st=4 foldmethod=marker foldmarker={{{,}}} syn=groovy
//vim600: encoding=utf-8 commentstring=//\ %s
