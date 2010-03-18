security {

    // see DefaultSecurityConfig.groovy for all settable/overridable properties

    active = true

    loginUserDomainClass = "labmaster.auth.Member"
    authorityDomainClass = "labmaster.auth.Role"
    requestMapClass = "labmaster.auth.RequestMap"

    useRequestMapDomainClass = false
    useControllerAnnotations = true
    //controllerAnnotationsRejectIfNoRule = true

    defaultRole = "ROLE_UNAVAILABLE"
    cacheUsers = false
       
    controllerAnnotationStaticRules = [
       '/register/**': ['IS_AUTHENTICATED_ANONYMOUSLY'],
       '/login/**': ['IS_AUTHENTICATED_ANONYMOUSLY'],
       '/captcha/**': ['IS_AUTHENTICATED_ANONYMOUSLY'],
       '/images/**': ['IS_AUTHENTICATED_ANONYMOUSLY'],
       '/js/**': ['IS_AUTHENTICATED_ANONYMOUSLY'],
       '/css/**': ['IS_AUTHENTICATED_ANONYMOUSLY'],
       '/logout/**': ['IS_AUTHENTICATED_FULLY'],
       '/testType/create/**': ['ROLE_ADMIN'],
       '/book/create/**': ['ROLE_BOOKADMIN'],
       '/book/test/**': ['IS_AUTHENTICATED_FULLY'],
       '/book/**': ['ROLE_SUPERVISOR'],
       '/member/create/**': ['ROLE_ADMIN'],
       '/member/edit/**': ['ROLE_ADMIN'],
       '/member/update/**': ['ROLE_ADMIN'],
       '/member/delete/**': ['ROLE_ADMIN'],
       '/**': ['IS_AUTHENTICATED_FULLY']
       ]
}
