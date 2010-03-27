package labmaster.task

class TaskController extends labmaster.auth.AccessControlController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        def user = getLoginedUser();
        if(!user) {
            flash.message = "您没有登陆，请先登陆系统"
            redirect controller:'login'
            return
        } 

        def results = []
        def totalCount = 0
        params.max = Math.min(params.max ? params.int('max') : 10, 100)

        // 老师
        if(user.doesInRole('ROLE_TEACHER')) {
            results = Task.list(params)
            totalCount = Task.count()
        } else { // 学生
            results = Task.findAllByAssignFromOrAssignTo(user, user, params)
            totalCount = Task.findAllByAssignFromOrAssignTo(user, user).size()
        }

        [taskInstanceList: results, taskInstanceTotal: totalCount]
    }

    def create = {
        def taskInstance = new Task()
        taskInstance.properties = params
        return [taskInstance: taskInstance]
    }

    def save = {
        def taskInstance = new Task()

        // 绑定数据
        bindData(taskInstance, params, 
                ['id', 'complete', 'endDate', 'dateCreated', 'lastUpdated'])
        if (taskInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'task.label', default: 'Task'), taskInstance.id])}"
            redirect(action: "show", id: taskInstance.id)
        }
        else {
            render(view: "create", model: [taskInstance: taskInstance])
        }
    }

    def show = {
        def taskInstance = Task.read(params.id)
        if (!taskInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'task.label', default: 'Task'), params.id])}"
            redirect(action: "list")
        }
        else {
            def user = getLoginedUser();
            if(!user) {
                flash.message = "您没有登陆，请先登陆系统";
                redirect controller:'login';
                return;
            } 

            if(!( user.doesInRole('ROLE_TEACHER') ||
                (taskInstance.assignFrom && taskInstance.assignFrom.doesUserSelf(user.id)) || 
                (taskInstance.assignTo && taskInstance.assignTo.doesUserSelf(user.id)) ) ) {
                flash.message = "只有老师或者任务的指派者和执行者才有权限查看任务" 
                redirect action:list
                return 
            }
            [taskInstance: taskInstance]
        }
    }

    def edit = {
        def taskInstance = Task.get(params.id)
        if (!taskInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'task.label', default: 'Task'), params.id])}"
            redirect(action: "list")
        }
        else {
            def user = getLoginedUser();
            if(!user) {
                flash.message = "您没有登陆，请先登陆系统";
                redirect controller:'login';
                return;
            } 

            if(! (taskInstance.assignFrom && taskInstance.assignFrom.doesUserSelf(user.id)  ) ) {
                flash.message = "只有任务的指派者才有权限修改任务" 
                redirect action:show, id:params.id;
                return 
            }
            return [taskInstance: taskInstance]
        }
    }

    def updateStatus = {
        def taskInstance = Task.get(params.id)
        if (!taskInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'task.label', default: 'Task'), params.id])}"
            redirect(action: "list")
        }
        else {
            def user = getLoginedUser();
            if(!user) {
                flash.message = "您没有登陆，请先登陆系统";
                redirect controller:'login';
                return;
            } 

            if(! (taskInstance.assignTo && taskInstance.assignTo.doesUserSelf(user.id)  ) ) {
                flash.message = "只有任务的执行者才有权限更新任务状态" 
                redirect action:show, id:params.id;
                return 
            }
            return [taskInstance: taskInstance]
        }
    }
    def update = {
        def taskInstance = Task.get(params.id)
        if (taskInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (taskInstance.version > version) {
                    
                    taskInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'task.label', default: 'Task')] as Object[], "Another user has updated this Task while you were editing")
                    render(view: "edit", model: [taskInstance: taskInstance])
                    return
                }
            }

            def user = getLoginedUser();
            if(!user) {
                flash.message = "您没有登陆，请先登陆系统";
                redirect controller:'login';
                return;
            } 

            if(!( (taskInstance.assignTo && taskInstance.assignTo.doesUserSelf(user.id)) ||
                (taskInstance.assignFrom && taskInstance.assignFrom.doesUserSelf(user.id))  ) ) {
                flash.message =
                    "只有任务的指派者和执行者才有权限修改任务或更新任务状态" 
                redirect action:show, id:params.id;
                return 
            }

            bindData taskInstance, params, ['id', 'assignFrom']
            if (!taskInstance.hasErrors() && taskInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'task.label', default: 'Task'), taskInstance.id])}"
                redirect(action: "show", id: taskInstance.id)
            }
            else {
                render(view: "edit", model: [taskInstance: taskInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'task.label', default: 'Task'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def taskInstance = Task.get(params.id)
        if (taskInstance) {
            def user = getLoginedUser();
            if(!user) {
                flash.message = "您没有登陆，请先登陆系统";
                redirect controller:'login';
                return;
            } 

            if(!(taskInstance.assignFrom && taskInstance.assignFrom.doesUserSelf(user.id)  ) ) {
                flash.message =
                    "只有任务的指派者才有权限删除任务" 
                redirect action:show, id:params.id;
                return 
            }

            try {
                taskInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'task.label', default: 'Task'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'task.label', default: 'Task'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'task.label', default: 'Task'), params.id])}"
            redirect(action: "list")
        }
    }
}
