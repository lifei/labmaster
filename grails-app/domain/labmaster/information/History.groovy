package labmaster.information

class History {
	labmaster.auth.Member user
	Date dateCreate = new Date()
	String content = ''
	Float value = 0.0
	String controller
	String action
	Integer type = 0

    static constraints = {
		user()
		dateCreate()
		content(widget:"textarea")
		type(range:0..5)
    }
}
