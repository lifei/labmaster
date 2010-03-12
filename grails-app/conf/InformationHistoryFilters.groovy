class InformationHistoryFilters
{
	def filters = {
			deleteForbid(controller:"history", action:"delete") {
				before = {
						flash.message = "不能删除历史！"
						redirect action:"list"
				}
			}
			
			createForbid(controller:"history", action:"delete") {
				before = {
						flash.message = "不能创建历史！"
						redirect action:"list"
				}				
			}
			
			createForbid(controller:"history", action:"edit") {
				before = {
						flash.message = "不能修改历史！"
						redirect action:"list"
				}				
			}
	}
}