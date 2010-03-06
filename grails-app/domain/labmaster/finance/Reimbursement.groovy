package labmaster.finance

class Reimbursement {
	
	float money	
	
	Date createTime = new Date()
	
	Date date
	
	static hasMany = [purchase: Purchase]
	
	static belongsTo = [assignFrom:labmaster.auth.Member, assignTo:labmaster.auth.Member]

    static constraints = {
		assignFrom()
		assignTo()
		money(min:(0.0 as float))
		date()
		purchase()
		createTime()
    }
	
	String toString() {
		"[${date}]${assignFrom}让${assignTo}去报账"
	}
}
