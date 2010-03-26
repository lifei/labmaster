package labmaster.auth

class AccessControlController {
	def authenticateService

        def user = null
	
	def index = {
	}
	

	def getLoginedUser() {
            if(authenticateService && user == null) {
		user = authenticateService.userDomain()
            }

            return user
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

	boolean isUserAdministrator() {
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
        boolean isUserSelf(def id) {
            if(user)
                return user.id == id

            return false
        }
}
