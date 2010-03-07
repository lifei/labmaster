package labmaster.task

class Project {
	
	String name
	String description
	
	static belongsTo = [leader: labmaster.auth.Member]
	static hasMany = [members: labmaster.auth.Member, plans: Plan]

    static constraints = {
		name(length:2..20)
		description(length:2..200, widget:"textarea")
		leader()
		members()
		plans()
    }
	
	String toString() {
		"${name} ${leader}"
	}
}
