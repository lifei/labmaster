package labmaster.finance

class Reimbursement {
	
	/** 报账金额 */
	float money	
	
	Date dateCreated
	Date lastUpdated
	
	/** 报账日期 */
	Date date
	
	static hasMany = [purchase: Purchase]
	
	static belongsTo = [assignFrom:labmaster.auth.Member, assignTo:labmaster.auth.Member]

    static constraints = {
		assignFrom()
		assignTo()
		money(min:(0.0 as float))
		date()
		purchase()
        dateCreated(nullable:true)
        lastUpdated(nullable:true)
    }
	
	String toString() {
		"[${date}]${assignFrom}让${assignTo}去报账"
	}
}
