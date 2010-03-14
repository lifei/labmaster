package labmaster.sample

import sun.security.action.GetLongAction;

class TestController extends labmaster.auth.AccessControlController{

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        def user = getLoginedUser()
        def results = []
        def count = 0
        
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        
        if(isUserTeacher(user)) {
        	results = Test.list(params)
        	count = Test.count()
        } else {
        	// 得到当前用户的Project
     		results = Test.findAllByUser(user, params)         		   
                count = Test.findAllByUser(user).size()
        }
        [testInstanceList: results, testInstanceTotal: count]
    }

    def create = {
    	def user = getLoginedUser()
    	
        def testInstance = new Test()
        testInstance.properties = params
        testInstance.user = user
        return [testInstance: testInstance]
    }

    def save = {
        def testInstance = new Test(params)
        // 用户验证
        def user = getLoginedUser()
        if(testInstance.user.id != user.id) {
            flash.message = '只有登记人才能删除本测试！'
            redirect(action: "list")
            return 
        }

        if (testInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'test.label', default: 'Test'), testInstance.id])}"
            redirect(action: "show", id: testInstance.id)
        }
        else {
            render(view: "create", model: [testInstance: testInstance])
        }
    }

    def show = {
        def testInstance = Test.get(params.id)
        if (!testInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'test.label', default: 'Test'), params.id])}"
            redirect(action: "list")
        }
        else {
            [testInstance: testInstance]
        }
    }

    def edit = {

        def testInstance = Test.get(params.id)
        if (!testInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'test.label', default: 'Test'), params.id])}"
            redirect(action: "list")
        }
        else {

            // 用户验证
            def user = getLoginedUser()
            if(testInstance.user.id != user.id) {
                flash.message = '只有登记人才能修改本测试！'
                redirect(action: "list")
                return 
            }

            // 失效判断
            def today = new Date()
            if(today - testInstance.dateCreated > 7) {
                flash.message = '本测试已经登记超过7天了，不能再进行修改！'
                redirect(action: "show", id: params.id)
                return 
            }
            return [testInstance: testInstance]
        }
    }

    def update = {
        def testInstance = Test.get(params.id)
        if (testInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (testInstance.version > version) {
                    
                    testInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'test.label', default: 'Test')] as Object[], "Another user has updated this Test while you were editing")
                    render(view: "edit", model: [testInstance: testInstance])
                    return
                }
            }
            testInstance.properties = params

            // 用户验证
            def user = getLoginedUser()
            if(testInstance.user.id != user.id) {
                flash.message = '只有登记人才能修改本测试！'
                redirect(action: "list")
                return 
            }

            // 失效判断
            def today = new Date()
            if(today - testInstance.dateCreated > 7) {
                flash.message = '本测试登记超过7天了，已经不能被修改！'
                redirect(action: "show", id: params.id)
                return 
            }

            if (!testInstance.hasErrors() && testInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'test.label', default: 'Test'), testInstance.id])}"
                redirect(action: "show", id: testInstance.id)
            }
            else {
                render(view: "edit", model: [testInstance: testInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'test.label', default: 'Test'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def testInstance = Test.get(params.id)
        if (testInstance) {
            // 用户验证
            def user = getLoginedUser()
            if(testInstance.user.id != user.id) {
                flash.message = '只有登记人才能删除本测试！'
                redirect(action: "list")
                return 
            }

            // 失效判断
            def today = new Date()
            if(today - testInstance.dateCreated > 7) {
                flash.message = '本测试已经登记超过7天了，不能被删除！'
                redirect(action: "show", id: params.id)
                return 
            }

            try {
                testInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'test.label', default: 'Test'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'test.label', default: 'Test'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'test.label', default: 'Test'), params.id])}"
            redirect(action: "list")
        }
    }
}
