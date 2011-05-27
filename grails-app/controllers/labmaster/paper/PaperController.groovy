package labmaster.paper

import org.springframework.web.multipart.MultipartHttpServletRequest
import java.io.File
import java.util.Date;

import javax.activation.CommandObject;

import labmaster.auth.Member;

import net.sf.jabref.BibtexEntry;
import net.sf.jabref.Globals;
import net.sf.jabref.JabRefPreferences;
import net.sf.jabref.imports.BibtexParser;
import net.sf.jabref.imports.EndnoteImporter
import net.sf.jabref.imports.ImportFormatReader;
import net.sf.jabref.imports.ParserResult;

class PaperController {

    com.solution51.sfu.SuperFileUploadService superFileUploadService

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
    
    def uploadbibtexpost = {
        String uploadFilename = params.uploadedFileId

        if (uploadFilename) { 
            // get the full path name of the file from the temp directory 
            File file = superFileUploadService.getTempUploadFile(uploadFilename)

            if(!file) {
            }

            def bibtex = file.getText()
            Globals.prefs = JabRefPreferences.getInstance();

            def bib = BibtexParser.singleFromString(bibtex)

            println bib.getAllFields()

            def keys = [ author:'author', issn:"issn", title:"title", url:'url', keywords:'keyword',
                abstruct:'abstract', notes:'note', pages:'pages', issue:'issue', journal:'journal', 
                year:'year', volume:'volume']

            Paper paper = Paper.get(params.id)

            keys.each { k, v ->
                def value = bib.getField(v)
                if(value) {
                    if(paper.getAt(k) instanceof Integer) {
                        paper.putAt(k, value as Integer)
                    } else if(paper.getAt(k) instanceof String) {
                        paper.putAt(k, value)
                    }
                }
            }
            if(paper.save(flush:true)) {
                def id = paper.id
                redirect(action:'addinfo', id:paper.id)
            }

        }else{
			flash.message = "上传Bibtex文件失败"
			redirect(action:'uploadbibtex')
		}
    }
	
	def uploadbibtex = {
		
		// 验证流程
		Paper paper = Paper.get(params.getAt("id"))
		
		if(paper.status > 2) {
			flash.message = "  该文献已被锁定  "
			redirect(action:'show', id:paper.id)
			return		
		}
		return [params:params]
	}

    def uploadpost = {
        String uploadFilename = params.uploadedFileId

        if (uploadFilename) { 
            // get the full path name of the file from the temp directory 
            File file = superFileUploadService.getTempUploadFile(uploadFilename)
			def id = params.id
			Paper paper
			if(id != null) {
				paper = Paper.get(id)
				println params
				println paper
			}
			
			if(!paper) {
				paper = new Paper()
			}
			
            paper.filename = params.filename
            if(paper.save(flush:true)) {
                id = paper.id
                // def destFile = new File("${grailsApplication.config.paper.dir}/${id}/main.pdf")
                def destFile = new File("E:/temp/${id}/main.pdf")
				if(destFile.exists()) {
					destFile.delete()
				}
				
                def dir = destFile.getParentFile()

                if(dir && !dir.exists()) {
                    dir.mkdirs();
                }

                if(file.renameTo(destFile)) {
                    flash.message = "${paper.filename}已经上传"  
                    paper.status = 1 // 已上传文件
                    paper.save(flush:true)
                    
                    def swfFile = "E:/temp/${id}/main.swf"

                    String swftools = "\"C:/Program Files/SWFTools/pdf2swf.exe\" \"${destFile}\" -o \"${swfFile}\""
                    Process proc=Runtime.getRuntime().exec(swftools);  
                    redirect(action:'uploadbibtex', id:paper.id)
                } else {
                    flash.message = "${paper.filename} -> ${destFile}上传失败, 文件已存在"  
                    redirect(action:'upload')
                }
            } else {
                flash.message = "${paper.filename}上传失败2"  
                redirect(action:'upload', id:paper.id)
            }

        }else{ 
            flash.message = "上传失败2"  
            redirect(action:'upload')
        }
    }

    def getswf = {
        def id = params.id
        def swfFile = new File("E:/temp/${id}/main.swf")

        byte[] bit = swfFile.readBytes()

        response.setContentType("application/x-shockwave-flash")
        response.setHeader("Content-Length", String.valueOf(bit.length))
        response.setHeader("Accept-Ranges", "bytes")


        def op = response.getOutputStream();

        op << new FileInputStream("E:/temp/${id}/main.swf")

        op.close()
    }

    def upload = {
        if( request instanceof MultipartHttpServletRequest)  {
            def file = request.getFile('file')
			def paperInstance
			if(params.id) {
				paperInstance = Paper.get(id)				
			} 
			
			if(!paperInstance) {
				paperInstance = new Paper()
			}
			
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
		if(!session.user) {
			session.user = Member.get(1)
		}
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

    def addinfopost = { AddInfoCommand cmd ->
		
        def paperInstance = Paper.get(params.id)
        if (paperInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (paperInstance.version > version) {
                    paperInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'paper.label', default: 'Paper')] as Object[], "Another user has updated this Paper while you were editing")
                    render(view: "addinfo", model: [paperInstance: paperInstance])
                    return
                }
            }
            paperInstance.properties = params
            if (!cmd.hasErrors() && paperInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'paper.label', default: 'Paper'), paperInstance.id])}"
                paperInstance.status = 2
                paperInstance.save(flush:true)
                redirect(action: "show", id: paperInstance.id)
            }
            else {
                render(view: "addinfo", model: [paperInstance: paperInstance, cmd:cmd])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'paper.label', default: 'Paper'), params.id])}"
            redirect(action: "list")
        }
    }
    
    def update = { AddInfoCommand cmd ->
		
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
            if (!cmd.hasErrors() && paperInstance.save(flush: true)) {
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

class AddInfoCommand {
	String title
	int year
	String author
	String abstruct
	String journal = ''
	String volume = ''
	String issue = ''
	String pages = ''
	String issn = ''
	String doi = ''
	String url = ''
	String label = ''
	String notes = ''
	String keywords = ''
	
	/** 
	 * 通讯地址
	 */
	String affiliation = ''
	
	static constraints = {
		author(blank:false, nullable:false, size:2..150)
		title(blank:false, nullable:false, size:2..150)
		pages(blank:false, nullable:false, size:2..30)
		journal(blank:false, nullable:false, size:2..256)
		url(blank:true, nullable:false, size:2..256)
		label(blank:false, nullable:false, size:2..256)
		notes(blank:true, nullable:false, size:2..256)
		affiliation(blank:true, nullable:false, size:2..256)
		issn(blank:false, nullable:false, size:2..256)
		abstruct(blank:false, nullable:false)
		year(min:1900)
		keywords(blank:false, nullable:false, size:2..256)
	}
}
