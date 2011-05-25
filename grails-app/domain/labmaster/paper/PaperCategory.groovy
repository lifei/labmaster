package labmaster.paper

/**
 * 文献的分类
 */
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

    /** 属性 */
    int type // system, personal

    /** 状态 */
    int status

    /** 是否公开 */
    Boolean isPublic

    static constraints = {
    }
}
