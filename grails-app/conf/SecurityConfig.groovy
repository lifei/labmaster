security {

	// see DefaultSecurityConfig.groovy for all settable/overridable properties

	active = true

	loginUserDomainClass = "labmaster.auth.Member"
	authorityDomainClass = "labmaster.auth.Role"
	requestMapClass = "labmaster.auth.RequestMap"

    defaultRole = "ROLE_UNAVAILABLE"
    cacheUsers = false
    	
	controllerAnnotationsRejectIfNoRule = true
    
    requestMapString = '''CONVERT_URL_TO_LOWERCASE_BEFORE_COMPARISON 
		  PATTERN_TYPE_APACHE_ANT 
		  /login/**=IS_AUTHENTICATED_ANONYMOUSLY 
		  /admin/**=ROLE_USER
          /book/test/**=IS_AUTHENTICATED_FULLY
          /book/**=ROLE_SUPERVISOR
		'''
}
