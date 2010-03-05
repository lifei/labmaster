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

    Date createDate = new Date()
    Date modifyDate
    String description
    String note
    String solution


    static belongsTo = [apparatus:Apparatus, user:labmaster.acl.User]

    static constraints = {
    }

    static searchable = true
}
