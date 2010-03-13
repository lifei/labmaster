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
        
        /** 完成日期 */
        Date endDate
        
        /** 截止日期 */
        Date deadline
        
        /** 完成度 */
        Integer complete
        
        /** 更新时间 */
        Date dateCreated
        Date lastUpdated
        
        /** 更新历史 */
        String history

        labmaster.auth.Member user = labmaster.auth.Member.getLoginedUser()
        
        static belongsTo = [user:labmaster.auth.Member, project:Project]
                            
        static hasMany = [works:Work]

        static constraints = {
                name(length:2..20)
                content(length:2..100, widget:"textarea")
                object(length:0..100, widget:"textarea")
                project()
                user()
                complete(range:0..100)
                lastUpdated(nullable:true)
                dateCreated(nullable:true)
        }
        
        String toString() {
                "${name}"
        }
}

// vim: fdm=marker sw=8 ts=8 enc=utf8
