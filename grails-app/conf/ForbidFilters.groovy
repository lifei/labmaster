class ForbidFilters
{
    def filters = {
        accessControl(controller:'accessControl', action: '*'){
            before = {
                redirect controller:'login', action: 'denied'
            }
        }
    }
}
