package labmaster.acl

class User {
	
	String username
	String password
	String realName

	Integer inYear = 2000;
	Date birth
	Boolean disabled = true
	String picture = 'default'		
	String tel
	String addr
	String idCard
	String otherCard
	
	static belongsTo = Group
	static hasMany =  [groups:Group]

    static constraints = {
		username(maxLength:32, blank:false, unique:true)
		password(maxLength:32, blank:false)
		inYear(min:1950, max:2050)
		birth(blank:true)
		tel(maxLength:32, nullable:true)
		addr(maxLength:128, nullable:true)
		idCard(maxLength:64, nullable:true)
		otherCard(maxLength:64, nullable:true)
		disabled(blank:false)
		picture(maxLength:256, nullable:true)
    }

	String toString() {
		"${realName}(${username})"
	}
}
