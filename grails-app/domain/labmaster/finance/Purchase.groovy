package labmaster.finance

class Purchase {
	
	String name
	float money
	Date dateCreated
	Date lastUpdated
	Date buyTime 
	Integer howToPay
	Integer status
	String cardSerial
	
	static belongsTo = [user:labmaster.auth.Member]

        static constraints = {
            name(length:0..30)
            money(min:(0.0 as float))
            buyTime()
            user()
            howToPay(range:0..5)
            status(range:0..5)
            cardSerial(length:0..20, blank:true)
            dateCreated(nullable:true)
            lastUpdated(nullable:true)
        }
	
	String toString() {
		"${name} ${money}元"
	}
}
