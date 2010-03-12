package labmaster.task

class Project {
	
        /** 名称 */
	String name
	String description
	
	static belongsTo = [leader: labmaster.auth.Member]
	static hasMany = [members: labmaster.auth.Member, plans: Plan]

	/** 更新时间 */
	Date dateCreate = new Date()
	Date lastUpdate = new Date()

	/** 更新历史 */
	String history

	static constraints = {
	      name(length:2..20)
	      description(length:2..200, widget:"textarea")
	      leader()
	      members()
	      plans()
	}
	
	String toString() {
	  "${name}"
	}
}
