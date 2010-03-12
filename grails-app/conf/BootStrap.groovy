import grails.util.GrailsUtil
import labmaster.auth.Role as Group;
import labmaster.auth.Member as User;
import labmaster.auth.RequestMap;

class BootStrap {

    def init = { servletContext ->    
        if(GrailsUtil.environment == 'test') {
            //* 初始化管理员, 用户组的数据 {{{
            // 预设分组
            Group adminGroup = Group.findByAuthority("ROLE_ADMIN");
            User admin = User.findByUsername("admin");
            if(!adminGroup) {
                
                println "增加系统管理员组"
                adminGroup = new Group(id:1,name:"系统管理员", authority: "ROLE_ADMIN",
                                description: "系统管理员组")
                adminGroup.save()
            } 
            
            // 预设管理员用户
            if(!admin) {
                
                println "增加管理员"
                admin = new User(username:"admin", passwd:"7c4a8d09ca3762af61e59520943dc26494f8941b", 
                                userRealName:"管理员", enabled:true, email: "admin@labmaster.info")
                admin.save()
            }
        
            if(admin && adminGroup) {
                try {
                        println "链接"
                        admin.addToAuthorities(adminGroup)
                } catch(e) {
                        println e
                }
            }

            if(!Group.findByAuthority("ROLE_LEADER")) {        	
                    println "增加课题组长Role"
                    new Group(name:"课题组长", authority: "ROLE_LEADER",
                                    description: "课题组的组长，拥有所有的操作权限").save()
            }
                
            if(!Group.findByAuthority("ROLE_PROF")) {
                    println "增加教授组"
                new Group(name:"教授", authority: "ROLE_PROF",
                            description: "教授组，拥有与教授相关的操作的权限").save()
            }
            
            if(!Group.findByAuthority("ROLE_ASS_PROF")){        	
                    println "增加副教授组"
                new Group(name:"副教授", authority: "ROLE_ASS_PROF",
                            description: "副教授组，拥有与副教授相关的操作的权限").save()
            }
            
            if(!Group.findByAuthority("ROLE_LECTURER")){        	
                    println "增加讲师组"
                new Group(name:"讲师", authority: "ROLE_LECTURER",
                            description: "讲师组，拥有与讲师相关的操作的权限").save()
            }
            
            if(!Group.findByAuthority("ROLE_POSTDOCTORAL")){        	
                    println "增加博士后组"
                new Group(name:"博士后", authority: "ROLE_POSTDOCTORAL",
                            description: "博士后组，拥有与博士后相关的操作的权限").save()
            }
            
            if(!Group.findByAuthority("ROLE_PHD")){        	
                    println "增加博士组"
                new Group(name:"博士", authority: "ROLE_PHD",
                            description: "博士组，拥有与博士相关的操作的权限").save()
            }
            
            if(!Group.findByAuthority("ROLE_MASTER")){        	
                    println "增加硕士组"
                new Group(name:"硕士", authority: "ROLE_MASTER",
                            description: "硕士组，拥有与硕士相关的操作的权限").save()
            }
            
            if(!Group.findByAuthority("ROLE_BACHELOR")){        	
                    println "增加本科组"
                new Group(name:"本科", authority: "ROLE_BACHELOR",
                            description: "本科组，拥有与本科相关的操作的权限").save()
            }
            
            if(!Group.findByAuthority("ROLE_ASSSTANT")){        	
                    println "增加助研人员组"
                new Group(name:"助研人员", authority: "ROLE_ASSSTANT",
                            description: "助研人员组，拥有与助研人员相关的操作的权限").save()
            }
            
            if(!Group.findByAuthority("ROLE_LEAVE")){        	
                    println "增加已毕业人员组"
                new Group(name:"已毕业", authority: "ROLE_LEAVE",
                            description: "已毕业组，拥有与已毕业人员相关的操作的权限").save()
            } 
            
            if(!Group.findByAuthority("ROLE_TEACHER")){        	
                    println "增加教师人员组"
                new Group(name:"教师", authority: "ROLE_TEACHER",
                            description: "教师组，拥有与教师人员相关的操作的权限").save()
            } 
            
            if(!Group.findByAuthority("ROLE_STUDENT")){        	
                    println "增加学生组"
                new Group(name:"学生", authority: "ROLE_STUDENT",
                            description: "学生组，拥有与学生人员相关的操作的权限").save()
            } 
            
            if(!Group.findByAuthority("ROLE_MEMBER")){        	
                    println "增加用户组"
                new Group(name:"用户", authority: "ROLE_MEMBER",
                            description: "用户组，拥有与用户人员相关的操作的权限").save()
            }
            
            if(!Group.findByAuthority("ROLE_UNAVAILABLE")){        	
                    println "未激活组"
                new Group(name:"未激活用户", authority: "ROLE_UNAVAILABLE",
                            description: "未激活用户组，拥有与未激活用户人员相关的操作的权限").save()
            }
            
            // 增加权限
            try {
                
                // 查看会员的列表
                try {
                        def list = ['ADMIN', 'LEADER', 'PROF', 'ASS_PROF', 'TEACHER', 'PHD', "MASTER", 'BACHOLAR', 'ASSISTANT', 'LEAVE']
                        def map = list.collect {"ROLE_$it"}.join(',')			
                        new RequestMap(url:"/member/list/**", configAttribute:map).save()
                } catch (e) {
                        println e
                }
                
                // 会员修改        	
                try {
                        def list = ['ADMIN', 'LEADER', 'PROF', 'ASS_PROF', 'TEACHER']
                        def map = list.collect {"ROLE_$it"}.join(',')				
                        new RequestMap(url:"/member/edit/**", configAttribute:map).save()
                } catch (e) {
                        println e
                }
                
                // 未注册用户可以注册
                try {
                	new RequestMap(url:"/register/**", configAttribute:'IS_AUTHENTICATED_ANONYMOUSLY').save()
                	new RequestMap(url:"/login/**", configAttribute:'IS_AUTHENTICATED_ANONYMOUSLY').save()
                	new RequestMap(url:"/captcha/**", configAttribute:'IS_AUTHENTICATED_ANONYMOUSLY').save()
                	new RequestMap(url:"/images/**", configAttribute:'IS_AUTHENTICATED_ANONYMOUSLY').save()
                	new RequestMap(url:"/js/**", configAttribute:'IS_AUTHENTICATED_ANONYMOUSLY').save()
                	new RequestMap(url:"/css/**", configAttribute:'IS_AUTHENTICATED_ANONYMOUSLY').save()
                	new RequestMap(url:"/", configAttribute:'IS_AUTHENTICATED_FULLY').save()
                }
                catch (e) {
                	println e
                }
                
               
            } catch(e) {
            }
            // }}}*/
        }
    }
    
    def destroy = {
    }
} 

// vim: fdm=marker enc=utf8 ts=8 sw=8
