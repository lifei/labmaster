package labmaster.paper

class PaperFile {

    /** id */
    Long id

    /** 文件名 */
    String filename

    /** 文献名 */
    Long paperId

    Date createtime
    Date updatetime

    /** 大小 */
    Long size

    /** 上传者 */
    Long userid

    static constraints = {
    }
}
