import labmaster.information.*;

class TaskProjectFilters 
{
	def authenticateService
	
	def filters = {
		historyForSave(controller:'project', action:'save') {
			after = {
					def history = new History(user: authenticateService.userDomain(), 
							controller:'project', action:'save', type:0)
					history.content = '';
					history.save()
			}
		}
	}
}