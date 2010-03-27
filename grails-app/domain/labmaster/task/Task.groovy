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
	
	/** 截止日期 */
	Date deadline = startDate + 7

	/** 完成日期 */
	Date endDate = startDate
	
	/** 完成度 */
	Integer complete = 0

        /** 进展 */
        String status
	
	/** 更新时间 */
	Date lastUpdated
        Date dateCreated
	
        static belongsTo = [assignFrom: labmaster.auth.Member, assignTo: labmaster.auth.Member]

        static constraints = {
            name(length: 2..20, blank:false)
            content(length:2..200, widget:"textarea", blank:false)
            object(length:2..100, widget:"textarea")
            complete(range:0..100)
            assignFrom(blank:false)
            assignTo(blank:false, validator: {
                val, obj->
                if(!val)
                    return 'blank'
                try {
                    if(!obj || obj.assignFrom.id == val.id)
                        return 'sameUser'
                } catch(e) {
                    return 'sameUser'
                }
            })
            startDate(blank:false)
            endDate()
            deadline(blank:false, validator: {
                val, obj->
                try {
                    if(val < obj.startDate) 
                        return 'wrongDeadline'
                } catch(e) {
                    return 'wrongDeadline'
                } 
            })	
            status()
            dateCreated(nullable:true)
            lastUpdated(nullable:true)
        }
}
