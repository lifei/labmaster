package labmaster.paper

class PaperCategory {

    /** 序号 */
    Long id

    /** 标题 */
    String name

    /** 父类别 */
    Long parentId

    Date createtime

    Date updatetime

    /** 创建者 */
    Long userId

    static constraints = {
    }
}
