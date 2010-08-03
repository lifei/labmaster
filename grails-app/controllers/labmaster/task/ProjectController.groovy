package labmaster.task

class ProjectController {
    
    def authenticateService

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        def user = authenticateService.userDomain()
        
        if(!user) {
                redirect controller:'login'
                return
        }
                        
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        
        // 教师
        def roleList = ['LEADER', 'ADMIN', 'PROF', 'ASS_PROF', 'LECTURER', 'POSTDOCTORAL', 'TEACHER'].collect {
                "ROLE_${it}"
        }
        
        // 当前登陆用户权限
        def userRoles =    user.authorities.collect {
                it.authority
        }
                        
        // 无交集说明不是老师
        def results = []
        def cnt = 0
        if(roleList.intersect(userRoles).size() == 0) {

            results = Project.getAllByUser(user,params)
            cnt = Project.getProjectCountByUser(user)
            println cnt
        }
        else {
            results = Project.list(params)
            cnt = Project.count()
        }
        [projectInstanceList: results, projectInstanceTotal: cnt]
    }

    def create = {
        def projectInstance = new Project()
        projectInstance.properties = params
        
        // 默认负责人是当前的用户
        projectInstance.leader = authenticateService.userDomain()
        return [projectInstance: projectInstance]
    }

    def save = {
        def projectInstance = new Project(params)
        
        if (projectInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'project.label', default: 'Project'), projectInstance.id])}"
            redirect(action: "show", id: projectInstance.id)
        }
        else {
            render(view: "create", model: [projectInstance: projectInstance])
        }
    }

    def show = {
        
        // 只有leader采用修改权限
        def user = authenticateService.userDomain()
        
        if(!user) {
            redirect controller:'login'    
            return
        }
        
        def projectInstance = Project.get(params.id)
        if (!projectInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'project.label', default: 'Project'), params.id])}"
            redirect(action: "list")
        }
        else {
            
            // 成员或负责人可以查看
            if(user.equals(projectInstance.leader) || projectInstance.members.collect{it.id}.contains(user.id))
                [projectInstance: projectInstance]
            else {
                flash.message = "只有课题的成员才可以查看！"
                redirect(action: "list")
            }
        }
    }

    def edit = {
        
        // 只有leader采用修改权限
        def user = authenticateService.userDomain()
        
        if(!user) {
            redirect controller:'login'    
            return
        }
        
        def projectInstance = Project.get(params.id)
        if (!projectInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'project.label', default: 'Project'), params.id])}"
            redirect(action: "list")
        }
        else {
            
            // 权限判断
            if(user.equals(projectInstance.leader))
                return [projectInstance: projectInstance]
            else {
                flash.message = "只有课题的负责人采用权限修改课题！"
                redirect action:'show', id:params.id
            }
        }
    }

    def update = {
        // 只有leader采用修改权限
        def user = authenticateService.userDomain()
        
        if(!user) {
            redirect controller:'login'            
            return 
        }
                
        def projectInstance = Project.get(params.id)
        if (projectInstance) {
            
            // 正常的流程不应该走到这一步
            // 用户不是课题的Leader却正在提交修改内容
            // 说明：
            // 1) 他在伪造请求；2）他在修改过程中登陆了多个账号
            // {{{
            if(user != projectInstance.leader){
                flash.message = "${message(code:'project.doNotCrack.message', default:'请不要破解本系统或者同时登陆多个账号！')}"
                redirect action:'show', id:params.id
                return
            }
            // }}}

            if (params.version) {
                def version = params.version.toLong()
                if (projectInstance.version > version) {
                    
                    projectInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'project.label', default: 'Project')] as Object[], "Another user has updated this Project while you were editing")
                    render(view: "edit", model: [projectInstance: projectInstance])
                    return
                }
            }
            projectInstance.properties = params
            if (!projectInstance.hasErrors() && projectInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'project.label', default: 'Project'), projectInstance.id])}"
                redirect(action: "show", id: projectInstance.id)
            }
            else {
                render(view: "edit", model: [projectInstance: projectInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'project.label', default: 'Project'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        
        def user = authenticateService.userDomain()
        
        if(!user) {
            redirect controller:'login'      
            return 
        }
    
        def projectInstance = Project.get(params.id)
        if (projectInstance) {
            
            // 判断权限
            if(!user.equals(projectInstance.leader)) {
                flash.message = "只有课题的负责人采用权限删除课题！"
                redirect action:'show', id:params.id
                return
            }
            
            if(projectInstance.plans.size() > 0) {
                flash.message = "为保证系统数据的安全，您不能删除已有计划的课题！"
                redirect action:'show', id:params.id
                return
            }
                
            try {
                projectInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'project.label', default: 'Project'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'project.label', default: 'Project'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'project.label', default: 'Project'), params.id])}"
            redirect(action: "list")
        }
    }
}
