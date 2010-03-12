package labmaster.auth

import org.codehaus.groovy.grails.commons.DefaultGrailsApplication
import org.codehaus.groovy.grails.commons.ControllerArtefactHandler



class AcessControlController {

	def authenticateService
	// def grailsApplication = new org.codehaus.groovy.grails.commons.GrailsApplication()
	
	def controllers
    def index = {
		def controllers = []
		 grailsApplication.getArtefact(ControllerArtefactHandler.TYPE, "MemberController").URIs.each{
		    def parts= it.split('/')
		    if(parts.size()>2){
		        actions << parts[2]
		    }
		}
		render actions
	}
}
