package labmaster.auth

import labmaster.auth.Member

/**
 * Authority domain class.
 */
class Role {

	static hasMany = [people: Member]
	/** name */
        String name
	/** description */
	String description
	/** ROLE String */
	String authority

	static constraints = {
		name(blank:false, unique:true)
		authority(blank: false, unique: true)
		description()
	}
	
	String toString() {
		"${description}"
	}
}
