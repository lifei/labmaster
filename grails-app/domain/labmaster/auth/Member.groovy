package labmaster.auth

import labmaster.auth.Role

/**
 * User domain class.
 */
class Member {
	static transients = ['pass']
	static hasMany = [authorities: Role]
	static belongsTo = Role

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

	/** plain password to create a MD5 password */
	String pass = '[secret]'

	static constraints = {
		username(size:4..32,blank: false, unique: true)
		userRealName(blank: false)
		passwd(blank: false)
		enabled()
	}
	
	String toString() {
		"${userRealName} (${username})"
	}

    static def getLoginedUser() {
        org.grails.plugins.springsecurity.service.AuthenticateService authenticateService = new org.grails.plugins.springsecurity.service.AuthenticateService()

        def user = authenticateService.userDomain()
        if (user) {
            return Member.get(user.id)
        }
        else {
            return null
        }
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
                if(id instanceof String)
                    return this.id == Integer.valueOf(id)
                return this.id == (id as Integer)
            }
        } catch(e) { }

        return false
    }

    boolean equals(Member m) {
    	m.id == this.id
    }
}
