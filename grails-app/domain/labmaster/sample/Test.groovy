package labmaster.sample

class Test {

    /** 测样人 */
    labmaster.auth.Member user

    /** 测样种类 */
    TestType type

    /** 登记时间 */
    Date dateCreated
    
    /** 数量 */
    Integer count

    static belongsTo = [user: labmaster.auth.Member, type: TestType]

    static constraints = {
        user()
        type()
        dateCreated(nullable:true)
        count(range:1..100)
    }
}

// vim: fdm=marker sw=4 ts=4
