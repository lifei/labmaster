package labmaster.book

class Book {
    
    String name
    String author
    String press
    Date dateCreated
    Date lastUpdated
    Integer type
    Integer status
    String location

    static typeMap = [0:'书籍', 1:'杂志', 2:'博士论文', 3:'硕士论文', 4:'报刊']
    static statusMap = [0:'存', 1:'借', 2:'还', 3:'评', 4:'论']
    
    /** 支持全文检索 */
    static searchable = true
    
    /** 录入者 */
    static belongsTo = [user: labmaster.auth.Member]

    static constraints = {
        name(length:1..20, blank:false, unique:true)
        author(length:2..30, blank:false)
        press(length:1..40, blank:false)
        type(range:0..5)
        status(range:0..5)
        location(length:1..40, blank:false)
        user()
        dateCreated(nullable:true)
        lastUpdated(nullable:true)
    }
    
    String toString() {
        "《${name}》(${author}) - ${press}"
    }
}

//vim600: ts=4 st=4 foldmethod=marker foldmarker={{{,}}} syn=groovy 
//vim600: encoding=utf8 fileenc=utf8 


