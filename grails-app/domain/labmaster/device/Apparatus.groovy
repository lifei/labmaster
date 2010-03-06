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

	/** �豸���� */
    String name
    
    /** ���к� */
    String serial
    
    /** �������� */
    Date buyDate
    
    /** �Ǽ�ʱ�� */
    Date createDate = new Date()
    
    /** ��Ӧ�� */
    String factory
    
    /** �������� */
    String description 
    
    /** ״̬ */
    int status
    
    /** ���� */
    int type
    
    /** ��ʷ */
    String history
    
    /** ����Ա */
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
