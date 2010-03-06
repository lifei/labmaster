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

	/** 设备名称 */
    String name
    
    /** 序列号 */
    String serial
    
    /** 购买日期 */
    Date buyDate
    
    /** 登记时间 */
    Date createDate = new Date()
    
    /** 供应商 */
    String factory
    
    /** 仪器描述 */
    String description 
    
    /** 状态 */
    int status
    
    /** 性质 */
    int type
    
    /** 历史 */
    String history
    
    /** 管理员 */
    static hasMany = [administrator: labmaster.auth.Member]

    static constraints = {
        serial(unique:true, blank:false)
        status(range:0..10)
        type(range:0..10)
    }

    String toString() {
        "${name} (${serial})"
    }
}
