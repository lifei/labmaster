package labmaster.task

class WorkController extends labmaster.auth.AccessControlController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        
        def user = getLoginedUser();
        if(!user) {
            flash.message = "您没有登陆，请先登陆系统";
            redirect controller:'login';
            return;
        } 

        def results = []
        def totalCount = 0
        params.max = Math.min(params.max ? params.int('max') : 10, 100)

        def queryField = []
        def queryValue = []

        def isTeacher = user.doesInRole('ROLE_TEACHER')

        // 处理assign
        switch(params.user) {
            case 'me':
                queryField << 'user=?'
                queryValue << user
                break
            case 'other':
                if(isTeacher) {
                    queryField << 'user!=?'
                    queryValue << user
                }
                break
            case 'customize':
                if(isTeacher && params."user.id") {
                    queryField << 'user=?'
                    queryValue << labmaster.auth.Member.read(params."user.id")
                }
        }

        switch(params.complete) {
            case 'yes':
                queryField << 'complete=?'
                queryValue << 100
                break
            case 'no':
                queryField << 'complete<?'
                queryValue << 100
                break
            case 'almost':
                queryField += ['complete<?','complete>?']
                queryValue += [100,50]
        }

        def today = new Date()

        switch(params.date) {
            case 'today':
                queryField << 'date between ? and ?'
                queryValue += [today - 1, today]
                break
            case 'yesterday':
                queryField << 'date between ? and ?'
                queryValue += [today - 2, today - 1]
                break
            case 'thisWeek':
                def c= new GregorianCalendar()
                def days = c.get(Calendar.DAY_OF_WEEK)
                if(days == 1)
                    days = 7
                else
                    days--
                queryField << 'date between ? and ?'
                queryValue += [today - days, today]
                break
            case 'lastWeek':
                def c= new GregorianCalendar()
                def days = c.get(Calendar.DAY_OF_WEEK)
                if(days == 1)
                    days = 7
                else
                    days--
                queryField << 'date between ? and ?'
                queryValue += [today - days - 7, today - 7]
                break
            case 'thisMonth':
                def c= new GregorianCalendar()
                def days = c.get(Calendar.DAY_OF_MONTH)
                queryField << 'date between ? and ?'
                queryValue += [today - days, today]
        }

        // 拼凑sql语句
        def hql = 'from Work'
        if(queryField.size() > 0)
            hql += ' where ' + queryField.join(' and ')

        if(params.sort && ['note','content', 'date'].contains(params.sort)) {
            hql += " order by ${params.sort}"

            if(params.order && ['desc', 'asc'].contains(params.order))
                hql += " ${params.order}"
        }

        // 处理排序
        results = Work.findAll(hql, queryValue, params)
        totalCount = Work.findAll(hql, queryValue).size()

        [workInstanceList: results, workInstanceTotal: totalCount]
    }

    /**
    def list = {// {{{
        def user = getLoginedUser()
        if(!user) {
                redirect controller:'login'
                return
        }

        def results = []
        def count = 0
        
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        
        if(isUserTeacher(user)) {
        	results = Work.list(params)
        	count = Work.count()
        } else {
        	// 得到当前用户的Project
        	def projects = Project.executeQuery("select a from Project as a inner join a.members as b where :user=b or a.leader=:user group by a",
         		   [user:user])

                if(projects.size() > 0) {
                    def plans = Plan.withCriteria {
                        'in'('project', projects) 
                    }

                    if(plans.size() > 0) {
                        results = Work.withCriteria {
                            'in'('plan', plans)
                            firstResult(Integer.valueOf(params.offset?params.offset:0))
                            maxResults(Integer.valueOf(params.max?params.max:10))
                        }
                                   
                        count = Work.withCriteria {
                                'in'('plan', plans)
                        }.size()
                    }
                }
        }
        
        [workInstanceList: results, workInstanceTotal: count]
    }// }}}
    */

    def create = {
        def user = getLoginedUser()
        if(!user) {
            redirect controller: 'login'
            return
        }

        def workInstance = new Work()
        workInstance.properties = params

        def plans = Plan.findAllByUserAndCompleteLessThan(user, 100)
        return [workInstance: workInstance, plans: plans, user: user]
    }

    def save = {
        def workInstance = new Work(params)
        def user = getLoginedUser();
        if(!user) {
            flash.message = "您没有登陆，请先登陆系统"
                redirect controller:'login'
                return
        } 
        workInstance.user = user

        // 进度判断

        if (workInstance.save(flush: true)) {

            // 同时更新进度
            def plan = workInstance.plan
            plan.complete = workInstance.progress
            plan.endDate = workInstance.date
            plan.save(flush:true)

            flash.message = "${message(code: 'default.created.message', args: [message(code: 'work.label', default: 'Work'), workInstance.id])}"
            redirect(action: "show", id: workInstance.id)
        }
        else {
            def plans = Plan.findAllByUserAndCompleteLessThan(user, 100)
            render(view: "create", model: [workInstance: workInstance, plans: plans, user: user])
        }
    }

    def show = {
        def workInstance = Work.read(params.id)
        if (!workInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'work.label', default: 'Work'), params.id])}"
            redirect(action: "list")
            return
        }

        def user = getLoginedUser()
        if(!user) {
            flash.message = "您没有登陆，请先登陆系统"
                redirect controller:'login'
                return
        } 

        // 不是老师，也不是自己的工作, 需要检测是不是一个项目组
        if(!(user.doesInRole('ROLE_TEACHER') || 
            (workInstance.user && workInstance.user.doesUserSelf(user.id)))) {

            def plan = workInstance.plan
            if(!plan) {
                flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'work.label', default: 'Work'), params.id])}"
                redirect(action: "list")
                return
            }

            def project = plan.project
            if(!project) {
                flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'work.label', default: 'Work'), params.id])}"
                redirect(action: "list")
                return
            }

            def members = []
                
            boolean isError = false
            project.members.each{
                try { 
                    members << it 
                } catch(e) {
                    isError = true
                }
            } 

            if(isError) {
                println '用户错误'
                project.members = members
                project.save(flush:true)
            }

            members << project.leader

            if(!members.contains(user)) {
                flash.message = '您没有权限查看本工作记录！'
                redirect(action: "list")
                return
            }
        }

        [workInstance: workInstance]
    }

    def edit = {
        def workInstance = Work.get(params.id)
        if (!workInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'work.label', default: 'Work'), params.id])}"
            redirect(action: "list")
        }
        else {
            def user = getLoginedUser()
            if(!user) {
                flash.message = '您没有登陆，请登陆'
                redirect controller:'login'
                return
            }

            // 只能修改自己的
            if(workInstance.user && workInstance.user.doesUserSelf(user.id))
                return [workInstance: workInstance]
            else {
                flash.message = '只能修改自己的工作记录'
                redirect action:show, id:params.id
            }
        }
    }

    def update = {
        def workInstance = Work.get(params.id)
        if (workInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (workInstance.version > version) {
                    
                    workInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'work.label', default: 'Work')] as Object[], "Another user has updated this Work while you were editing")
                    render(view: "edit", model: [workInstance: workInstance])
                    return
                }
            }

            def user = getLoginedUser();
            if(!user) {
                flash.message = "您没有登陆，请先登陆系统"
                    redirect controller:'login'
                    return
            } 

            if(!(workInstance.user &&
                        workInstance.user.doesUserSelf(user.id))) {
                flash.message = "只有工作记录的创建者才能修改" 
                redirect action:show, id:params.id
                return
            }

            // 不可修改的字段
            bindData workInstance, params, ['id', 'user', 'plan',
                     'dateCreated', 'lastUpdated', 'progress']

            if (!workInstance.hasErrors() && workInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'work.label', default: 'Work'), workInstance.id])}"
                redirect(action: "show", id: workInstance.id)
            }
            else {
                render(view: "edit", model: [workInstance: workInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'work.label', default: 'Work'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def workInstance = Work.get(params.id)
        if (workInstance) {

            def user = getLoginedUser()
            if(!user) {
                flash.message = "您没有登陆，请先登陆系统"
                redirect controller:'login'
                return
            }

            if(!(user.doesInRole('ROLE_TEACHER') ||
                    (workInstance.user && workInstance.user.doesUserSelf(user.id)))) {
                flash.message = "只有老师或记录的本人才有权利删除工作记录" 
                redirect action:show, id:params.id
                return
            }

            // 如果是老师和自己, 一周内可以删除
            if(workInstance.dateCreated && (new Date() - workInstance.dateCreated < 7)) {
                flash.message = '不允许删除登记超过一周的工作记录'
                redirect action:show, id:params.id
                return 
            }

            try {
                workInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'work.label', default: 'Work'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'work.label', default: 'Work'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'work.label', default: 'Work'), params.id])}"
            redirect(action: "list")
        }
    }
}

/*
vim600: ts=4 st=4 foldmethod=marker foldmarker={{{,}}} syn=groovy
vim600: encoding=utf-8 commentstring=//\ %s
 */
