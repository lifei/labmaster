package labmaster.paper

class PaperCategoryController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        def list = PaperCategory.findAll("from PaperCategory where parentId=0")
        [paperCategoryInstanceList: list, paperCategoryInstanceTotal: list.size()]
    }

    def create = {
        def paperCategoryInstance = new PaperCategory()
        paperCategoryInstance.properties = params
        return [paperCategoryInstance: paperCategoryInstance]
    }

    def save = {
        def paperCategoryInstance = new PaperCategory(params)
        if (paperCategoryInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'paperCategory.label', default: 'PaperCategory'), paperCategoryInstance.id])}"
            redirect(action: "show", id: paperCategoryInstance.id)
        }
        else {
            render(view: "create", model: [paperCategoryInstance: paperCategoryInstance])
        }
    }

    def show = {
        def paperCategoryInstance = PaperCategory.get(params.id)
        if (!paperCategoryInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'paperCategory.label', default: 'PaperCategory'), params.id])}"
            redirect(action: "list")
        }
        else {
            [paperCategoryInstance: paperCategoryInstance]
        }
    }

    def edit = {
        def paperCategoryInstance = PaperCategory.get(params.id)
        if (!paperCategoryInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'paperCategory.label', default: 'PaperCategory'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [paperCategoryInstance: paperCategoryInstance]
        }
    }

    def update = {
        def paperCategoryInstance = PaperCategory.get(params.id)
        if (paperCategoryInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (paperCategoryInstance.version > version) {
                    
                    paperCategoryInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'paperCategory.label', default: 'PaperCategory')] as Object[], "Another user has updated this PaperCategory while you were editing")
                    render(view: "edit", model: [paperCategoryInstance: paperCategoryInstance])
                    return
                }
            }
            paperCategoryInstance.properties = params
            if (!paperCategoryInstance.hasErrors() && paperCategoryInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'paperCategory.label', default: 'PaperCategory'), paperCategoryInstance.id])}"
                redirect(action: "show", id: paperCategoryInstance.id)
            }
            else {
                render(view: "edit", model: [paperCategoryInstance: paperCategoryInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'paperCategory.label', default: 'PaperCategory'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def paperCategoryInstance = PaperCategory.get(params.id)
        if (paperCategoryInstance) {
            try {
                paperCategoryInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'paperCategory.label', default: 'PaperCategory'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'paperCategory.label', default: 'PaperCategory'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'paperCategory.label', default: 'PaperCategory'), params.id])}"
            redirect(action: "list")
        }
    }
}
