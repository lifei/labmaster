package labmaster.item

class StandardItem {

    /** 名称 */
    String name

    /** 图片 */
    String pic = 'images/noimg.gif'

    /** 笔记 */
    String note

    /** Tags */
    String tags

    /** 创建时间 */
    Date dateCreated
    Date lastUpdated

    static constraints = {
        name(blank:false, maxSize:128)
        pic(blank:false, maxSize:128)
        note(blank:true, maxSize:1000)
        tags(blank:true, maxSize:128)
        dateCreated(nullable:true)
        lastUpdated(nullable:true)
    }
}
