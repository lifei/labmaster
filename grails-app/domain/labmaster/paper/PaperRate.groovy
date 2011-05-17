package labmaster.paper

class PaperRate {

    /** Id */
    Long id

    /** 分数 */
    int value

    /** 打分人 */
    Long userId

    /** 原因 */
    String content

    /** 时间 */
    Date time

    /** 文献 */
    Long paperId

    static constraints = {
    }
}
