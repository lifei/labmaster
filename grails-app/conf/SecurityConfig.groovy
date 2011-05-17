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

    defaultTargetUrl = '/frame'

    filterProcessesUrl = '/j_spring_security_check'
       
    controllerAnnotationStaticRules = [
       '/logout/**': ['IS_AUTHENTICATED_FULLY'],
       '/book/create/**': ['ROLE_BOOKADMIN'],
       '/book/test/**': ['IS_AUTHENTICATED_FULLY'],
       '/book/**': ['IS_AUTHENTICATED_FULLY'],
       '/testType/create/**': ['ROLE_ADMIN'],
       '/member/create/**': ['ROLE_ADMIN'],
       '/**': ['IS_AUTHENTICATED_FULLY'],
       '/register/**': ['IS_AUTHENTICATED_ANONYMOUSLY'],
       '/login/**': ['IS_AUTHENTICATED_ANONYMOUSLY'],
       '/captcha/**': ['IS_AUTHENTICATED_ANONYMOUSLY'],
       '/images/**': ['IS_AUTHENTICATED_ANONYMOUSLY'],
       '/js/**': ['IS_AUTHENTICATED_ANONYMOUSLY'],
       '/css/**': ['IS_AUTHENTICATED_ANONYMOUSLY']
       ]

    filterInvocationDefinitionSourceMap = [
        //'/j_spring_security_check': 'httpSessionContextIntegrationFilter,logoutFilter,authenticationProcessingFilter,captchaAuthenticationFilter,securityContextHolderAwareRequestFilter,rememberMeProcessingFilter,anonymousProcessingFilter,exceptionTranslationFilter,filterInvocationInterceptor',
        '/j_spring_security_check': 'httpSessionContextIntegrationFilter,captchaAuthenticationFilter,securityContextHolderAwareRequestFilter,anonymousProcessingFilter,exceptionTranslationFilter,filterInvocationInterceptor',
        '/**': 'httpSessionContextIntegrationFilter,logoutFilter,authenticationProcessingFilter,securityContextHolderAwareRequestFilter,rememberMeProcessingFilter,anonymousProcessingFilter,exceptionTranslationFilter,filterInvocationInterceptor'
    ]
}
