package labmaster.task

class Plan {
	
	/** 标题 */
	String name
	
	/** 内容 */
	String content	
	
	/** 目标 */
	String object
	
	Date createTime = new Date()
	
	/** 起始日期 */
	Date startDate = new Date()
	
	/** 完成日期 */
	Date endDate
	
	/** 截止日期 */
	Date deadline
	
	/** 完成度 */
	Integer complete
	
	/** 更新时间 */
	Date updateTime = new Date()
	
	/** 更新历史 */
	String history
	
	static belongsTo = [user:labmaster.auth.Member, project:Project]
	                    
    static hasMany = [works:Work, members: labmaster.auth.Member]

    static constraints = {
		name(length:2..20)
		content(length:2..100, widget:"textarea")
		object(length:0..100, widget:"textarea")
		project()
		user()
		complete(range:0..100)
    }
	
	String toString() {
		"${name}"
	}
}
