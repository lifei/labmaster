package labmaster.acl

class Group {
	
	String name	
	
	// �鿴��ɾ�����޸ġ����
	Integer acl = 0		
	
	static hasMany = [users:User]	

    static constraints = {
		name(maxLength:64, blank:false, unique:true)
		acl(min:0, blank:false)
    }
	
	static mapping = {
		table 'grouplist'
	}
	
	String toString() {
		"${name}"
	}
}
