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

    /** 进度 */
    Integer progress

    /** 预计完成 */
    Date finishDate = this.date + 1

    Date dateCreated
    Date lastUpdated

    static belongsTo = [user: labmaster.auth.Member, plan: labmaster.task.Plan]

    static constraints = {
        user(blank:false)
        plan(blank:false)
        content(length:2..50, blank:false)
        note(blank:true, widget:"textarea")
        date(blank:false, validator:{
            val, obj->
            if(!val || !obj.plan || !obj.plan.startDate || val < obj.plan.startDate) {
                return 'wrongDate'
            }
        })
        hour(range:1..30)
        progress(range:1..100, validator:{
            val, obj->
            if(!val || !obj.plan || obj.plan.complete > val) {
                return 'smallProgress'
                }
        })
        finishDate(validator:{
            val, obj->
            if(!val || val - obj.date < 1) {
                return 'wrongFinishDate'
            }
        })
        dateCreated(nullable:true)
        lastUpdated(nullable:true)
    }

    String toString() {
        "[$date] $content ($hour 小时)"
    }

}
