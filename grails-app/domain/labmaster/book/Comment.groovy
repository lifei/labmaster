package labmaster.book

class Comment {
	
	Date time = new Date()
	String comment
	
	static belongsTo = [user: labmaster.auth.Member, book: Book]

    static constraints = {
		book()
		user()
		comment(length:2..50, widget:"textarea")
    }
}
