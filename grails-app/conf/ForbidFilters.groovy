/**
 *  禁止所有用户访问的请列在此处
 */

class ForbidFilters
{
    def filters = {
    	
    	// 权限控制的基类
        accessControl(controller:'accessControl', action: '*'){
            before = {
                redirect controller:'login', action: 'denied'
            }
        }
        
        // 历史类不容篡改
        historyEdit(controller:'history', action: 'edit'){
            before = {
                redirect controller:'login', action: 'denied'
            }
        }
        
        historyUpdate(controller:'history', action: 'update'){
            before = {
                redirect controller:'login', action: 'denied'
            }
        }
        
        historyDelete(controller:'history', action: 'delete'){
            before = {
                redirect controller:'login', action: 'denied'
            }
        }
    }
}
