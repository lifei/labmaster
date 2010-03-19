package labmaster.acegi.captcha

import org.springframework.security.AuthenticationException

public class WrongCaptchaException extends AuthenticationException{
    public WrongCaptchaException(String msg, Throwable t) {
        super(msg, t);
    }

    public WrongCaptchaException(String msg) {
        super(msg);
    }
}

