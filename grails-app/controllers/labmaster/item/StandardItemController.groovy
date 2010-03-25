package labmaster.item
import org.codehaus.groovy.grails.plugins.springsecurity.Secured

class StandardItemController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [standardItemInstanceList: StandardItem.list(params), standardItemInstanceTotal: StandardItem.count()]
    }

    @Secured(['ROLE_ITEMADMIN'])
    def create = {
        def standardItemInstance = new StandardItem()
        standardItemInstance.properties = params
        return [standardItemInstance: standardItemInstance]
    }

    @Secured(['ROLE_ITEMADMIN'])
    def save = {
        def standardItemInstance = new StandardItem(params)
        if (standardItemInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'standardItem.label', default: 'StandardItem'), standardItemInstance.id])}"
            redirect(action: "show", id: standardItemInstance.id)
        }
        else {
            render(view: "create", model: [standardItemInstance: standardItemInstance])
        }
    }

    def show = {
        def standardItemInstance = StandardItem.get(params.id)
        if (!standardItemInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'standardItem.label', default: 'StandardItem'), params.id])}"
            redirect(action: "list")
        }
        else {
            [standardItemInstance: standardItemInstance]
        }
    }

    @Secured(['ROLE_ITEMADMIN'])
    def edit = {
        def standardItemInstance = StandardItem.get(params.id)
        if (!standardItemInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'standardItem.label', default: 'StandardItem'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [standardItemInstance: standardItemInstance]
        }
    }

    @Secured(['ROLE_ITEMADMIN'])
    def update = {
        def standardItemInstance = StandardItem.get(params.id)
        if (standardItemInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (standardItemInstance.version > version) {
                    
                    standardItemInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'standardItem.label', default: 'StandardItem')] as Object[], "Another user has updated this StandardItem while you were editing")
                    render(view: "edit", model: [standardItemInstance: standardItemInstance])
                    return
                }
            }
            standardItemInstance.properties = params
            if (!standardItemInstance.hasErrors() && standardItemInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'standardItem.label', default: 'StandardItem'), standardItemInstance.id])}"
                redirect(action: "show", id: standardItemInstance.id)
            }
            else {
                render(view: "edit", model: [standardItemInstance: standardItemInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'standardItem.label', default: 'StandardItem'), params.id])}"
            redirect(action: "list")
        }
    }

    @Secured(['ROLE_ITEMADMIN'])
    def delete = {
        // 确保所有的条目都不相关方可删除
        def standardItemInstance = StandardItem.get(params.id)
        if (standardItemInstance) {
            try {
                standardItemInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'standardItem.label', default: 'StandardItem'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'standardItem.label', default: 'StandardItem'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'standardItem.label', default: 'StandardItem'), params.id])}"
            redirect(action: "list")
        }
    }
}
