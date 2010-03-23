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
        
        if(user.doesInRole('ROLE_TEACHER')) {
        	results = Plan.list(params)
        	count = Plan.count()
        } else {
        	// 得到当前用户的Project
        	def projects = Project.executeQuery("select a from Project as a inner join a.members as b where :user=b or a.leader=:user group by a",
         		   [user:user])
         		   
                if(projects.size() > 0) {
                    results = Plan.withCriteria {
                            'in'('project', projects)
                            firstResult(Integer.valueOf(params.offset?params.offset:0))
                            maxResults(Integer.valueOf(params.max?params.max:10))
                    }
                               
                    count = Plan.withCriteria {
                            'in'('project', projects)
                    }.size()
                }
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

        def planInstance = new Plan(params)
        return [planInstance: planInstance, projects: projects, user:user]
    }

    def save = {
        def user = getLoginedUser();
        if(!user) {
            flash.message = "您没有登陆，请先登陆系统"
                redirect controller:'login'
                return
        } 

        // 得到当前用户的Project
        def projects = Project.getProjectBelongsToUser(user)
            
        def planInstance = new Plan()
        
        bindData planInstance, params, ['id', 'user', 'dateCreated',
                 'lastUpdated', 'complete'] 
        planInstance.user = user
        planInstance.complete = 0

        // 验证project是否有效
        if(!projects.contains(planInstance.project)) {
            flash.message = "课题错误，请不要破解本系统！"
            render(view: "create", model: [planInstance: planInstance, projects: projects, user: user])
            return
        }

        if (planInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'plan.label', default: 'Plan'), planInstance.id])}"
            redirect(action: "show", id: planInstance.id)
        }
        else {
            render(view: "create", model: [planInstance: planInstance, projects:projects, user: user])
        }
    }

    def show = {
        def planInstance = Plan.read(params.id)
        if (!planInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'plan.label', default: 'Plan'), params.id])}"
            redirect(action: "list")
        }
        else {
            def user = getLoginedUser();
            if(!user) {
                flash.message = "您没有登陆，请先登陆系统"
                    redirect controller:'login'
                    return
            } 

            if(user.doesInRole('ROLE_TEACHER') ||
                (planInstance.user && planInstance.user.doesUserSelf(user.id))) {
                params.offset = params.int('offset') ? params.int('offset'):0
                def works = Work.findAllByPlan(planInstance,
                    [sort:'progress', order:'desc', max:10, offset:params.offset])
                return [planInstance: planInstance, works:works]
            } else {
                flash.message = "只有老师或创建计划的本人才能查看" 
                redirect action:list
                return 
            }
        }
    }

    def edit = {
        def planInstance = Plan.get(params.id)
        if (!planInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'plan.label', default: 'Plan'), params.id])}"
            redirect(action: "list")
        }
        else {
            def user = getLoginedUser();
            if(!user) {
                flash.message = "您没有登陆，请先登陆系统"
                    redirect controller:'login'
                    return
            } 
            // 验证用户
            if(!(planInstance.user && planInstance.user.doesUserSelf(user.id))) {
                flash.message = "用户错误，只有计划人才有权限修改该计划！"
                redirect action: "show", id:params.id
                return
            }

            return [planInstance: planInstance]
        }
    }

    def update = {
        def planInstance = Plan.get(params.id)
        if (planInstance) {

            if (params.version) {
                def version = params.version.toLong()
                if (planInstance.version > version) {
                    
                    planInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'plan.label', default: 'Plan')] as Object[], "Another user has updated this Plan while you were editing")
                    render(view: "edit", model: [planInstance: planInstance, user: user])
                    return
                }
            }
           
            def user = getLoginedUser();
            if(!user) {
                flash.message = "您没有登陆，请先登陆系统"
                    redirect controller:'login'
                    return
            } 

            if(!(planInstance.user &&
                planInstance.user.doesUserSelf(user.id))) {
                flash.message = "只有计划的本人才可以修改计划" 
                redirect action:show, id:params.id
                return 
            }

            // 只考虑下列字段
            bindData planInstance, params, [include:['name', 'content', 'object', 'deadline', 'startDate']] 

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


    // 只有创建计划前7天内可删而且不能有Work
    def delete = {
        def planInstance = Plan.get(params.id)
        if (planInstance) {
            def user = getLoginedUser();
            if(!user) {
                flash.message = "您没有登陆，请先登陆系统"
                redirect controller:'login'
                return
            } 

            // 验证用户
            if(!(planInstance.user && planInstance.user.doesUserSelf(user.id))) {
                flash.message = "只有计划人才有权限删除该计划！"
                redirect(action: "show", id: params.id)
                return
            }

            // 验证时间
            if(!planInstance.dateCreated || new Date() - planInstance.dateCreated  > 6) {
                flash.message = "计划发布一周以后不可以被删除！"
                redirect(action: "show", id: params.id)
                return
            }

            // 验证工作
            if(planInstance.works && planInstance.works.size() > 0) {
                flash.message = '已有工作登记的计划不允许被删除'
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
