security {

	// see DefaultSecurityConfig.groovy for all settable/overridable properties

	active = true

	loginUserDomainClass = "labmaster.auth.Member"
	authorityDomainClass = "labmaster.auth.Role"
	requestMapClass = "labmaster.auth.RequestMap"

        defaultRole = "ROLE_UNAVAILABLE"
}
