package labmaster.task

import labmaster.auth.AccessControlController

class PlanController extends AccessControlController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        def user = getLoginedUser()
        
        if(!user) {
                redirect controller:'login'
                return
        }

        def results = []
        def count = 0
        
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        
        if(isUserTeacher(user)) {
        	results = Plan.list(params)
        	count = Plan.count()
        } else {
        	// 得到当前用户的Project
        	def projects = Project.executeQuery("select a from Project as a inner join a.members as b where :user=b or a.leader=:user group by a",
         		   [user:user])
         		   
     		results = Plan.withCriteria {
                        'in'('project', projects)
                        firstResult(Integer.valueOf(params.offset?params.offset:0))
                        maxResults(Integer.valueOf(params.max?params.max:10))
                }
         		   
                count = Plan.withCriteria {
                        'in'('project', projects)
                }.size()
        }
        
        
        [planInstanceList: results, planInstanceTotal: count]
    }

    def create = {
        def user = getLoginedUser()
        
        if(!user) {
                redirect controller:'login'
                return
        }

        // 得到当前用户的Project
        def projects = Project.getProjectBelongsToUser(user)

        def planInstance = new Plan()
        planInstance.properties = params
        return [planInstance: planInstance, projects: projects, user:user]
    }

    def save = {
        def user = getLoginedUser()
        
        if(!user) {
                redirect controller:'login'
                return
        }

        // 得到当前用户的Project
        def projects = Project.getProjectBelongsToUser(user)
            
        def planInstance = new Plan(params)

        // 验证project是否有效
        if(!projects.contains(planInstance.project)) {
            flash.message = "课题错误，请不要破解本系统！"
            render(view: "create", model: [planInstance: planInstance, projects: projects, user: user])
            return
        }

        // 验证用户
        if(!(user == planInstance.user)) {
            flash.message = "用户错误，请不要破解本系统！"
            render(view: "create", model: [planInstance: planInstance, projects: projects, user: user])
            return
        }

        if (planInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'plan.label', default: 'Plan'), planInstance.id])}"
            redirect(action: "show", id: planInstance.id)
        }
        else {
            render(view: "create", model: [planInstance: planInstance])
        }
    }

    def show = {
        def user = getLoginedUser()
        
        if(!user) {
                redirect controller:'login'
                return
        }

        def planInstance = Plan.get(params.id)
        if (!planInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'plan.label', default: 'Plan'), params.id])}"
            redirect(action: "list")
        }
        else {
            [planInstance: planInstance]
        }
    }

    def edit = {
        def user = getLoginedUser()
        
        if(!user) {
                redirect controller:'login'
                return
        }

        def planInstance = Plan.get(params.id)
        if (!planInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'plan.label', default: 'Plan'), params.id])}"
            redirect(action: "list")
        }
        else {
            // 验证用户
            if(!(user == planInstance.user)) {
                flash.message = "用户错误，只有计划人才有权限修改该计划！"
                redirect action: "show", id:params.id
                return
            }
            return [planInstance: planInstance]
        }
    }

    def update = {
        def user = getLoginedUser()
        
        if(!user) {
                redirect controller:'login'
                return
        }

        def planInstance = Plan.get(params.id)
        if (planInstance) {

            if (params.version) {
                def version = params.version.toLong()
                if (planInstance.version > version) {
                    
                    planInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'plan.label', default: 'Plan')] as Object[], "Another user has updated this Plan while you were editing")
                    render(view: "edit", model: [planInstance: planInstance])
                    return
                }
            }
            
            def oldProject = planInstance.project
            def oldUser = planInstance.user
            planInstance.properties = params

            // 验证project是否有效
            if(oldProject.id != planInstance.project.id) {
                flash.message = "课题错误，请不要破解本系统！"
                render(view: "edit", model: [planInstance: planInstance])
                return
            }

            // 验证用户
            if(!(user == planInstance.user && oldUser == user)) {
                flash.message = "用户错误，请不要破解本系统！"
                render(view: "edit", model: [planInstance: planInstance])
                return
            }

            if (!planInstance.hasErrors() && planInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'plan.label', default: 'Plan'), planInstance.id])}"
                redirect(action: "show", id: planInstance.id)
            }
            else {
                render(view: "edit", model: [planInstance: planInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'plan.label', default: 'Plan'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def user = getLoginedUser()
        
        if(!user) {
                redirect controller:'login'
                return
        }

        def planInstance = Plan.get(params.id)
        if (planInstance) {

            // 验证用户
            if(!(user == planInstance.user)) {
                flash.message = "只有计划人才有权限删除该计划！"
                redirect(action: "show", id: params.id)
                return
            }

            try {
                planInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'plan.label', default: 'Plan'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'plan.label', default: 'Plan'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'plan.label', default: 'Plan'), params.id])}"
            redirect(action: "list")
        }
    }
}
