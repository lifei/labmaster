import org.codehaus.groovy.grails.plugins.springsecurity.AuthorizeTools

// Place your Spring DSL code here
beans = {
    captchaAuthenticationFilter(
        labmaster.acegi.captcha.CaptchaAuthenticationProcessingFilter) {
            def conf = AuthorizeTools.securityConfig.security
            if (!conf || !conf.active) {
                println '[active=false] Spring Security not loaded'
                return
            }
            // attributes
            authenticationManager = ref('authenticationManager')
            authenticationFailureUrl = conf.authenticationFailureUrl //'/login/authfail?login_error=1'
            ajaxAuthenticationFailureUrl = conf.ajaxAuthenticationFailureUrl // /login/authfail?ajax=true
            defaultTargetUrl = conf.defaultTargetUrl // '/'
            alwaysUseDefaultTargetUrl = conf.alwaysUseDefaultTargetUrl // false
            filterProcessesUrl = conf.filterProcessesUrl // '/j_spring_security_check'
            rememberMeServices = ref('rememberMeServices')
            authenticateService = ref('authenticateService')

   }
}
