package labmaster.sample

class Test {

    /** 测试时间 */
    Date date

    /** 测样人 */
    labmaster.auth.Member user

    /** 测样种类 */
    TestType type

    Date dateCreate

    static belongsTo = [user: labmaster.auth.Member, type: TestType]

    static constraints = {
        date()
        user()
        type()
    }
}

// vim: fdm=marker sw=4 ts=4
