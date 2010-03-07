package labmaster.task

import java.util.Date;

class Task {
	
	/** 标题 */
	String name
	
	/** 内容 */
	String content
	
	/** 目标 */
	String object
	
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
	
	static belongsTo = [assignFrom: labmaster.auth.Member, assignTo: labmaster.auth.Member]

    static constraints = {
		name(length: 2..20)
		content(length:2..200, widget:"textarea")
		object(length:2..100, widget:"textarea")
		complete(range:0..100)
		assignFrom()
		assignTo()
		startDate()
		endDate()
		deadline()	
		updateTime()
		history()
    }
}
