package labmaster.auth

class AccessControlController {
	def authenticateService
	
	def index = {
	}
	
	def getLoginedUser() {
		return authenticateService.userDomain()
	}
	
	def isUserTeacher(def user) {
		
		// 教师
		def roleList = ['LEADER', 'ADMIN', 'PROF', 'ASS_PROF', 'LECTURER', 'POSTDOCTORAL', 'TEACHER'].collect {
			"ROLE_${it}"
		}
		
		// 当前登陆用户权限
		def userRoles =	user.authorities.collect {
			it.authority
		}
		
		return roleList.intersect(userRoles).size() > 0
	}
	
	def isUserAdministrator(def user) {
		// 教师
		def roleList = ['LEADER', 'ADMIN'].collect {
			"ROLE_${it}"
		}
		
		// 当前登陆用户权限
		def userRoles =	user.authorities.collect {
			it.authority
		}
		
		return roleList.intersect(userRoles).size() > 0		
	}
	
}
