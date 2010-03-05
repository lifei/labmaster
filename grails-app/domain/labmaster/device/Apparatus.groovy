package labmaster.device


/** ===========================
  @package labmaster
  @subpackage device
  @version 1.0
  @author lifei
  @email  lifei.job@gmail.com
   =========================== 
  */
class Apparatus {

    String name
    String serial
    Date buyDate
    Date createDate = new Date()
    String factory
    String description 


    static constraints = {
        serial(unique:true, blank:false)
    }

    String toString() {
        "${name} (${serial})"
    }
}
