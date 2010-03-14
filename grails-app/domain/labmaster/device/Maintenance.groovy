package labmaster.device



/********************************
  维修记录类
  @package labmaster
  @subpackage device
  @filename: Maintenance.groovy
  @author   Li Fei
  @email    lifei.chn@mail.nankai.edu.cn
 ********************************/

class Maintenance {
    
    /** 损坏时间 */
    Date badDay
    
    /** 更新时间 */
    Date lastUpdated
    Date dateCreated
    
    /** 状态 */
    Integer status
    
    /** 问题描述 */
    String description
    
    /** 经验 */
    String note
    
    /** 解决方法 */
    String solution

    /** 设备以及报修人 */
    static belongsTo = [apparatus:Apparatus, user:labmaster.auth.Member]

    static constraints = {
    	status(range:0..5)
        dateCreated(nullable:true)
        lastUpdated(nullable:true)
    }

    static searchable = true
}
