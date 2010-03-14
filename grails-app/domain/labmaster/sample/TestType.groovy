package labmaster.sample

class TestType {

    /** 名称 */
    String name

    /** 描述 */
    String description

    /** 方法 */
    String note

    /** 单价 */
    Float price

    /** 更新时间 */
    Date lastUpdated

    static constraints = {
        name(length:0..20, blank:false)
        description(blank:true, widget:"textarea")
        note(blank:true, widget:"textarea")
        price(range:0..1000)
        lastUpdated(nullable:true)
    }
}
