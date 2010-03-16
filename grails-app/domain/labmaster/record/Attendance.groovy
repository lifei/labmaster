package labmaster.record

class Attendance {

    /** 来的时间 */
    Date dateCreated

    /** 走的时间 */
    Date lastUpdated

    static belongsTo = [user: labmaster.auth.Member]

    /** 活跃度 */
    Integer count = 0

    /** 日期 */
    Date date

    static constraints = {
        user()
        dateCreated()
        lastUpdated()
        count() 
        date()
    }
}
