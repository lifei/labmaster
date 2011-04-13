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
    Date dateCreated
    Date lastUpdated
    
    /** 供应商 */
    String factory
    
    /** 仪器描述 */
    String description 
    
    /** 状态 */
    Integer status
    
    /** 性质 */
    Integer type
    
    /** 管理员 */
    static hasMany = [administrator: labmaster.auth.Member]

    static constraints = {
        serial(unique:true, blank:false)
        status(range:0..10)
        type(range:0..10)
        dateCreated(nullable:true)
        lastUpdated(nullable:true)
    }

    String toString() {
        "${name} (${serial})"
    }
}
