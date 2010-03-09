package labmaster.task

class Work {
    
    /** 工作内容 */
    String content
    
    /** 记录 */
    String note
    
    /** 日期 */
    Date date = new Date()
    
    /** 工作时间 */
    Integer hour
    
    static belongsTo = [user: labmaster.auth.Member, plan: labmaster.task.Plan]
                        
    static constraints = {
        user()
        plan()
        content(length:0..50, blank:false)
        note(blank:true, widget:"textarea")
        date()
        hour()
    }
    
    String toString() {
        "[$date] ($hour 小时) $content"
    }
    
}
