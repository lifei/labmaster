package labmaster.auth

import labmaster.auth.Member

/**
 * Authority domain class.
 */
class Role {

	static hasMany = [people: Member]

	/** description */
	String description
	/** ROLE String */
	String authority

	static constraints = {
		authority(blank: false, unique: true)
		description()
	}
}
