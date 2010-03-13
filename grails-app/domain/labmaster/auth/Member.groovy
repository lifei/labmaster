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
	boolean enabled

	String email
	boolean emailShow

	/** description */
	String description = ''

	/** plain password to create a MD5 password */
	String pass = '[secret]'

	static constraints = {
		username(blank: false, unique: true)
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
    
    boolean equals(Member m) {
    	m.id == this.id
    }
}
