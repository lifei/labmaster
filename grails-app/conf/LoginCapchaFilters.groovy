import labmaster.information.*;

class LoginCapchaFilters 
{
	def filters = {
		checkCapcha(controller:'j_spring_security_check') {
			before = {
                            if(params.captcha.toUpperCase() != session.captcha) {
                                flash.captcha = true
                                flash.messages = '验证码错误！'
                                redirect controller:'login', action: 'auth', params:params
                            }
			}
		}
	}
}
