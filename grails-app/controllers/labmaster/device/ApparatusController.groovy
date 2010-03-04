package labmaster.device

class ApparatusController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [apparatusInstanceList: Apparatus.list(params), apparatusInstanceTotal: Apparatus.count()]
    }

    def create = {
        def apparatusInstance = new Apparatus()
        apparatusInstance.properties = params
        return [apparatusInstance: apparatusInstance]
    }

    def save = {
        def apparatusInstance = new Apparatus(params)
        if (apparatusInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'apparatus.label', default: 'Apparatus'), apparatusInstance.id])}"
            redirect(action: "show", id: apparatusInstance.id)
        }
        else {
            render(view: "create", model: [apparatusInstance: apparatusInstance])
        }
    }

    def show = {
        def apparatusInstance = Apparatus.get(params.id)
        if (!apparatusInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'apparatus.label', default: 'Apparatus'), params.id])}"
            redirect(action: "list")
        }
        else {
            [apparatusInstance: apparatusInstance]
        }
    }

    def edit = {
        def apparatusInstance = Apparatus.get(params.id)
        if (!apparatusInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'apparatus.label', default: 'Apparatus'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [apparatusInstance: apparatusInstance]
        }
    }

    def update = {
        def apparatusInstance = Apparatus.get(params.id)
        if (apparatusInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (apparatusInstance.version > version) {
                    
                    apparatusInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'apparatus.label', default: 'Apparatus')] as Object[], "Another user has updated this Apparatus while you were editing")
                    render(view: "edit", model: [apparatusInstance: apparatusInstance])
                    return
                }
            }
            apparatusInstance.properties = params
            if (!apparatusInstance.hasErrors() && apparatusInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'apparatus.label', default: 'Apparatus'), apparatusInstance.id])}"
                redirect(action: "show", id: apparatusInstance.id)
            }
            else {
                render(view: "edit", model: [apparatusInstance: apparatusInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'apparatus.label', default: 'Apparatus'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def apparatusInstance = Apparatus.get(params.id)
        if (apparatusInstance) {
            try {
                apparatusInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'apparatus.label', default: 'Apparatus'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'apparatus.label', default: 'Apparatus'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'apparatus.label', default: 'Apparatus'), params.id])}"
            redirect(action: "list")
        }
    }
}
