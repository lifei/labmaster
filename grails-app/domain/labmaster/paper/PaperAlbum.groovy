package labmaster.paper

/**
 * 文集
 */
class PaperAlbum {

    Long id

    /** 文集名 */
    String name

    /** 是否公开 */
    Boolean isPublic

    Long userId

    static constraints = {
    }
}
