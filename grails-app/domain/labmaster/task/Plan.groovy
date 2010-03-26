package labmaster.task

class Plan {
        
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
        Date endDate = deadline
        
        /** 完成度 */
        Integer complete = 0
        
        /** 更新时间 */
        Date dateCreated
        Date lastUpdated

        labmaster.auth.Member user = labmaster.auth.Member.getLoginedUser()
        
        static belongsTo = [user:labmaster.auth.Member, project:Project]
                            
        static hasMany = [works:Work]

        static constraints = {
                name(length:2..20,blank:false)
                content(length:2..100, widget:"textarea",blank:false)
                object(length:0..100, widget:"textarea",blank:false)
                project(blank:false)
                user(blank:false)
                complete(range:0..100, blank:false)
                deadline(validator:{
                    val, obj->
                    if(!val || obj.startDate >= val) {
                        return 'wrongDeadline'
                    }
                })
                lastUpdated(nullable:true)
                dateCreated(nullable:true)
        }
        
        String toString() {
                "${name}"
        }
}

// vim: fdm=marker sw=8 ts=8 enc=utf8
