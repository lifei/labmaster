package labmaster.information

class History {
	labmaster.auth.Member user
	Date dateCreate = new Date()
	String content
	Float value
	String controller
	String action
	Integer type

    static constraints = {
		user()
		dateCreate()
		content(widget:"textarea")
    }
}
