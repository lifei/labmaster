package labmaster.book

class Book {
	
	String name
	String author
	String press
	Date createTime = new Date()
	Date updateTime
	int type
	int status
	String location
	
	/** 支持全文检索 */
	static searchable = true
	
	/** 录入者 */
	static belongsTo = [user: labmaster.auth.Member]

    static constraints = {
		name(length:0..20)
		author(length:0..30)
		press(length:0..40)
		type(range:0..5)
		status(range:0..5)
		location(length:0..40)
		user()
    }
	
	String toString() {
		"《${name}》(${author}) - ${press}"
	}
}
