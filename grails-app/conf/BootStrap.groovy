import labmaster.acl.*;

class BootStrap {

    def init = { servletContext ->    


        if(!Group.findByName("课题组长"))
            new Group(name:"课题组长").save()
        if(!Group.findByName("教授"))
            new Group(name:"教授").save()
        if(!Group.findByName("副教授"))
            new Group(name:"副教授").save()
        if(!Group.findByName("讲师"))
            new Group(name:"讲师").save()
        if(!Group.findByName("教师"))
            new Group(name:"教师").save()
        if(!Group.findByName("博士后"))
            new Group(name:"博士后").save()
        if(!Group.findByName("博士"))
            new Group(name:"博士").save()
        if(!Group.findByName("硕士"))
            new Group(name:"硕士").save()
        if(!Group.findByName("本科"))
            new Group(name:"本科").save()
        if(!Group.findByName("助研人员"))
            new Group(name:"助研人员").save()
        if(!Group.findByName("已毕业"))
            new Group(name:"已毕业").save()
            
       
        
        // 预设分组
        Group adminGroup = Group.findByName("系统管理员");
        User admin = User.findByUsername("admin");
        if(!adminGroup) {
            adminGroup = new Group(name:"系统管理员")
            adminGroup.save()
        } 
        
        // 预设管理员用户
        if(!admin) {
            admin = new User(username:"admin", password:"123456", 
            		realName:"管理员", birth:new Date(), inYear:2000,
            		disabled:false)
            admin.save()
        }
    
	    if(admin && adminGroup) {
	    	println "here"
	    	try {
	    		admin.addToGroups(adminGroup)
	    	} catch(e) {
	    		println e
	    	}
	    }
    }
    def destroy = {
    }
} 
