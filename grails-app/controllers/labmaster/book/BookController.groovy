package labmaster.book
import org.codehaus.groovy.grails.plugins.springsecurity.Secured
import labmaster.information.History

class BookController {

    def authenticateService

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [bookInstanceList: Book.list(params), bookInstanceTotal: Book.count()]
    }

    @Secured(['ROLE_BOOKADMIN'])
    def create = {
        def bookInstance = new Book()
        bookInstance.properties = params
        return [bookInstance: bookInstance]
    }

    @Secured(['ROLE_BOOKADMIN'])
    def save = {
        def u = authenticateService.userDomain()
        if(!u) {
            redirect action:list
            return
        }
        def bookInstance = new Book(params)
        bookInstance.user = u
        if (bookInstance.save(flush: true)) {
            flash.message = "${message(code: 'book.created.message', args: [message(code: 'book.label', default: 'Book'), bookInstance.name])}"
            def xml = new StringWriter()
            def book = new groovy.xml.MarkupBuilder(xml)
            book.book(){
                id(bookInstance.id)
                name(bookInstance.name)
                location(bookInstance.location)
                author(bookInstance.author)
                type(bookInstance.type)
                status(bookInstance.status)
            }

            def history = new History(user:u, controller:'book', action:'save',
                    content:xml.toString())
            history.save(flush:true)
            redirect(action: "show", id: bookInstance.id)
        }
        else {
            render(view: "create", model: [bookInstance: bookInstance])
        }
    }

    def show = {
        def bookInstance = Book.get(params.id)
        if (!bookInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'book.label', default: 'Book'), params.id])}"
            redirect(action: "list")
        }
        else {
            [bookInstance: bookInstance]
        }
    }

    @Secured(['ROLE_BOOKADMIN'])
    def edit = {
        def bookInstance = Book.get(params.id)
        if (!bookInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'book.label', default: 'Book'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [bookInstance: bookInstance]
        }
    }

    @Secured(['ROLE_BOOKADMIN'])
    def update = {
        def u = authenticateService.userDomain()
        def bookInstance = Book.get(params.id)
        if (bookInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (bookInstance.version > version) {
                    
                    bookInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'book.label', default: 'Book')] as Object[], "Another user has updated this Book while you were editing")
                    render(view: "edit", model: [bookInstance: bookInstance])
                    return
                }
            }
            bookInstance.properties = params
            if (!bookInstance.hasErrors() && bookInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'book.label', default: 'Book'), bookInstance.id])}"

                def xml = new StringWriter()
                def book = new groovy.xml.MarkupBuilder(xml)
                book.book(){
                    id(bookInstance.id)
                    name(bookInstance.name)
                    location(bookInstance.location)
                    author(bookInstance.author)
                    type(bookInstance.type)
                    status(bookInstance.status)
                }

                def history = new History(user:u, controller:'book', action:'update',
                        content:xml.toString())
                history.save(flush: true)
                redirect(action: "show", id: bookInstance.id)
            }
            else {
                render(view: "edit", model: [bookInstance: bookInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'book.label', default: 'Book'), params.id])}"
            redirect(action: "list")
        }
    }

    @Secured(['ROLE_BOOKADMIN'])
    def delete = {
        def bookInstance = Book.get(params.id)
        if (bookInstance) {
            try {
                def xml = new StringWriter()
                def book = new groovy.xml.MarkupBuilder(xml)
                book.book(){
                    id(bookInstance.id)
                    name(bookInstance.name)
                    location(bookInstance.location)
                    author(bookInstance.author)
                    type(bookInstance.type)
                    status(bookInstance.status)
                }

                def history = new History(user:authenticateService.userDomain(),
                        controller:'book', action:'delete', content:xml.toString())
                history.save(flush:true)
                bookInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'book.label', default: 'Book'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'book.label', default: 'Book'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'book.label', default: 'Book'), params.id])}"
            redirect(action: "list")
        }
    }
}
