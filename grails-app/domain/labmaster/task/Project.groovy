package labmaster.task

class Project {
	
        /** 名称 */
	String name
	String description
	
	static belongsTo = [leader: labmaster.auth.Member]
	static hasMany = [members: labmaster.auth.Member, plans: Plan]

	/** 更新时间 */
	Date dateCreated
	Date lastUpdated

	static constraints = {
	      name(length:2..20,blank:false)
	      description(length:2..200, widget:"textarea",blank:false)
	      leader()
	      members()
	      plans()
	      dateCreated(nullable:true)	
	      lastUpdated(nullable:true)
	}
	
	String toString() {
	  "${name}"
	}

        static def getProjectBelongsToUser(def user) {
            return Project.executeQuery(
                    "select a from Project as a inner join a.members as b where :user=b or a.leader=:user group by a",
                    [user:user])
        }
}
