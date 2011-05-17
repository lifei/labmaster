package labmaster.paper

import org.springframework.web.multipart.MultipartHttpServletRequest

class PaperController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [paperInstanceList: Paper.list(params), paperInstanceTotal: Paper.count()]
    }

    def create = {
        def paperInstance = new Paper()
        paperInstance.properties = params
        return [paperInstance: paperInstance]
    }

    def upload = {
        if( request instanceof MultipartHttpServletRequest)  {
            def file = request.getFile('file')

            def paperInstance = new Paper()
            if( file && !file.empty )  
            {  
                if (paperInstance.save(flush: true)) {
                    String filename = "./${paperInstance.id}.txt"

                    file.transferTo(new java.io.File(filename))  
                    flash.message = "${file.getOriginalFilename()}已经上传"  

                    paperInstance.filename = file.getOriginalFilename()
                    paperInstance.status = 1 // 已上传文件
                    paperInstance.save(flush:true)
                    redirect(action:'addinfo', id:paperInstance.id)
                }
            }  

            return [paperInstance: paperInstance]
        } else {
            def paperInstance = new Paper()
            paperInstance.properties = params
            return [paperInstance: paperInstance]
        }
    }

    def download = {
        def id = params.id
    }

    def save = {
        def paperInstance = new Paper(params)
        if (paperInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'paper.label', default: 'Paper'), paperInstance.id])}"
            redirect(action: "show", id: paperInstance.id)
        }
        else {
            render(view: "create", model: [paperInstance: paperInstance])
        }
    }

    def show = {
        def paperInstance = Paper.get(params.id)
        if (!paperInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'paper.label', default: 'Paper'), params.id])}"
            redirect(action: "list")
        }
        else {
            [paperInstance: paperInstance]
        }
    }

    def addinfo = {
        def paper = Paper.get(params.id)
        if (!paper) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'paper.label', default: 'Paper'), params.id])}"
            redirect(action: "list")
        } else {
            return [paperInstance: paper]
        }
    }

    def edit = {
        def paperInstance = Paper.get(params.id)
        if (!paperInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'paper.label', default: 'Paper'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [paperInstance: paperInstance]
        }
    }

    def addinfopost = {
        def paperInstance = Paper.get(params.id)
        if (paperInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (paperInstance.version > version) {
                    paperInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'paper.label', default: 'Paper')] as Object[], "Another user has updated this Paper while you were editing")
                    render(view: "edit", model: [paperInstance: paperInstance])
                    return
                }
            }
            paperInstance.properties = params
            if (!paperInstance.hasErrors() && paperInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'paper.label', default: 'Paper'), paperInstance.id])}"
                paperInstance.status = 2
                paperInstance.save(flush:true)
                redirect(action: "show", id: paperInstance.id)
            }
            else {
                render(view: "edit", model: [paperInstance: paperInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'paper.label', default: 'Paper'), params.id])}"
            redirect(action: "list")
        }
    }
    
    def update = {
        def paperInstance = Paper.get(params.id)
        if (paperInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (paperInstance.version > version) {
                    
                    paperInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'paper.label', default: 'Paper')] as Object[], "Another user has updated this Paper while you were editing")
                    render(view: "edit", model: [paperInstance: paperInstance])
                    return
                }
            }
            paperInstance.properties = params
            if (!paperInstance.hasErrors() && paperInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'paper.label', default: 'Paper'), paperInstance.id])}"
                redirect(action: "show", id: paperInstance.id)
            }
            else {
                render(view: "edit", model: [paperInstance: paperInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'paper.label', default: 'Paper'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def paperInstance = Paper.get(params.id)
        if (paperInstance) {
            try {
                paperInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'paper.label', default: 'Paper'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'paper.label', default: 'Paper'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'paper.label', default: 'Paper'), params.id])}"
            redirect(action: "list")
        }
    }
}
