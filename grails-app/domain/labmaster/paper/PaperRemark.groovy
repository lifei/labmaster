package labmaster.paper

/**
 * 评论 
 */
class PaperRemark {

    /** ID */
    Long id

    /** 用户 */
    Long userId

    /** 文献 */
    Long paperId

    /** 时间 */
    Date time

    /** 内容 */
    String content

    static constraints = {
    }
}
