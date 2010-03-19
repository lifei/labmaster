package labmaster.acegi.captcha

import javax.servlet.http.*;
import org.apache.commons.logging.*;
import org.springframework.security.Authentication
import org.codehaus.groovy.grails.plugins.springsecurity.GrailsAuthenticationProcessingFilter
import org.springframework.security.AuthenticationException

public class CaptchaAuthenticationProcessingFilter extends GrailsAuthenticationProcessingFilter {

    private Log log = LogFactory.getLog(CaptchaAuthenticationProcessingFilter.class);

    @Override
    public Authentication attemptAuthentication(HttpServletRequest request) throws AuthenticationException {
        def auth = super.attemptAuthentication(request); 
        verifyCaptcha(request);
        return auth
    }

    public void verifyCaptcha(HttpServletRequest httpServletRequest) throws AuthenticationException {

        String inputValidationCode = httpServletRequest.getParameter( "captcha" );
        //从Session中取出验证码
        String ssnValidationCode = (String)httpServletRequest.getSession().getAttribute( "captcha" );

        if( ssnValidationCode != null && !ssnValidationCode.equals( inputValidationCode.toUpperCase() ) ){
            //用户输入的值与看到的不一致,抛出异常
            throw new WrongCaptchaException("Wrong captcha value entered");
        }
    }

    /**
     * {@inheritDoc}
     * @see org.springframework.security.ui.AbstractProcessingFilter#determineFailureUrl(
     *  javax.servlet.http.HttpServletRequest, org.springframework.security.AuthenticationException)
     */
    @Override
    protected String determineFailureUrl(HttpServletRequest request, AuthenticationException failed) {
        return super.determineFailureUrl(request, failed)
    }

}
