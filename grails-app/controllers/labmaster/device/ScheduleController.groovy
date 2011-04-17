package labmaster.device

class ScheduleController {
	
	static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

	def scaffold = Schedule
	
	/**
	 * save a new schedule
	 */
    def save = {
		
        def scheduleInstance = new Schedule(params)
        def ret = scheduleInstance.isValid()
        if ( ret.ret && scheduleInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'schedule.label', default: 'Schedule'), scheduleInstance.id])}"
            redirect(action: "show", id: scheduleInstance.id)
        }
        else {
        	flash.message = "${message(code: ret.msg)}"
        	render(view: "create", model: [scheduleInstance: scheduleInstance])
        }
    }
}
