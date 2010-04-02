package labmaster.sample
import org.codehaus.groovy.grails.plugins.springsecurity.Secured

class TestTypeController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index = {
        redirect(action: "list", params: params)
    }

    @Secured(['ROLE_TESTADMIN'])
    def create = {
        def testTypeInstance = new TestType()
        testTypeInstance.properties = params
        return [testTypeInstance: testTypeInstance]
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [testTypeInstanceList: TestType.list(params), testTypeInstanceTotal: TestType.count()]
    }

    @Secured(['ROLE_TESTADMIN'])
    def save = {
        def testTypeInstance = new TestType(params)
        if (testTypeInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'testType.label', default: 'TestType'), testTypeInstance.id])}"
            redirect(action: "show", id: testTypeInstance.id)
        }
        else {
            render(view: "create", model: [testTypeInstance: testTypeInstance])
        }
    }

    def show = {
        def testTypeInstance = TestType.get(params.id)
        if (!testTypeInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'testType.label', default: 'TestType'), params.id])}"
            redirect(action: "list")
        }
        else {
            [testTypeInstance: testTypeInstance]
        }
    }

    @Secured(['ROLE_TESTADMIN'])
    def edit = {
        def testTypeInstance = TestType.get(params.id)
        if (!testTypeInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'testType.label', default: 'TestType'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [testTypeInstance: testTypeInstance]
        }
    }

    @Secured(['ROLE_TESTADMIN'])
    def update = {
        def testTypeInstance = TestType.get(params.id)
        if (testTypeInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (testTypeInstance.version > version) {
                    
                    testTypeInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'testType.label', default: 'TestType')] as Object[], "Another user has updated this TestType while you were editing")
                    render(view: "edit", model: [testTypeInstance: testTypeInstance])
                    return
                }
            }
            testTypeInstance.properties = params
            if (!testTypeInstance.hasErrors() && testTypeInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'testType.label', default: 'TestType'), testTypeInstance.id])}"
                redirect(action: "show", id: testTypeInstance.id)
            }
            else {
                render(view: "edit", model: [testTypeInstance: testTypeInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'testType.label', default: 'TestType'), params.id])}"
            redirect(action: "list")
        }
    }

    @Secured(['ROLE_TESTADMIN'])
    def delete = {
        def testTypeInstance = TestType.get(params.id)

        if (testTypeInstance) {

            // 有效性判断
            def testList = Test.findByTest(testTypeInstance)
            if(testList && testList.size() > 0)
            {
                flash.message = '您不可以删除该测试类型, 除非您先删除所有该测试类型的登记'
                redirect action:show, id:params.id
                return
            }

            try {
                testTypeInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'testType.label', default: 'TestType'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'testType.label', default: 'TestType'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'testType.label', default: 'TestType'), params.id])}"
            redirect(action: "list")
        }
    }
}
