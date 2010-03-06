package labmaster.auth

class MemberController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [memberInstanceList: Member.list(params), memberInstanceTotal: Member.count()]
    }

    def create = {
        def memberInstance = new Member()
        memberInstance.properties = params
        return [memberInstance: memberInstance]
    }

    def save = {
        def memberInstance = new Member(params)
        if (memberInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'member.label', default: 'Member'), memberInstance.id])}"
            redirect(action: "show", id: memberInstance.id)
        }
        else {
            render(view: "create", model: [memberInstance: memberInstance])
        }
    }

    def show = {
        def memberInstance = Member.get(params.id)
        if (!memberInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'member.label', default: 'Member'), params.id])}"
            redirect(action: "list")
        }
        else {
            [memberInstance: memberInstance]
        }
    }

    def edit = {
        def memberInstance = Member.get(params.id)
        if (!memberInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'member.label', default: 'Member'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [memberInstance: memberInstance]
        }
    }

    def update = {
        def memberInstance = Member.get(params.id)
        if (memberInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (memberInstance.version > version) {
                    
                    memberInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'member.label', default: 'Member')] as Object[], "Another user has updated this Member while you were editing")
                    render(view: "edit", model: [memberInstance: memberInstance])
                    return
                }
            }
            memberInstance.properties = params
            if (!memberInstance.hasErrors() && memberInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'member.label', default: 'Member'), memberInstance.id])}"
                redirect(action: "show", id: memberInstance.id)
            }
            else {
                render(view: "edit", model: [memberInstance: memberInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'member.label', default: 'Member'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def memberInstance = Member.get(params.id)
        if (memberInstance) {
            try {
                memberInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'member.label', default: 'Member'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'member.label', default: 'Member'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'member.label', default: 'Member'), params.id])}"
            redirect(action: "list")
        }
    }
}
