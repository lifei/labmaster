package labmaster.device

class Schedule {
	
	Date date
	int beginTime
	int endTime
	Date createTime = new Date()
	
	static belongsTo = [apparatus:Apparatus, user:labmaster.auth.Member]

    static constraints = {
		beginTime(range:0..24)
		endTime(range:0..24)
		date(blank:false)
    }
	
	
	def isValid() {
		
		if(beginTime >= endTime) {
			return [ret:false, msg: 'schedule.wrongtime.message']
		}
		
		// �г���̨������������Ԥ���ļ�¼
        def schedules = Schedule.findAll("from Schedule as b where b.apparatus=:apparatus and date=:date",
        		[apparatus:apparatus, date:date])
        		
        		
        beginTime = (beginTime as int)
        endTime = (endTime as int)
        
        try {
	        // ˵���Ѿ�������Ԥ����¼���������ڵĳ�ͻ        
	    	schedules.each {
	        	// �н�������
	    		if((beginTime >= it.beginTime && beginTime < it.endTime) // ��ʼʱ���ͻ
					|| ( endTime > it.beginTime && endTime <= it.endTime)) {// ����ʱ���ͻ
	    			throw new Exception()
	    		}
	    		
	    		// ���������
	    		if(beginTime <= it.beginTime && endTime >= it.endTime) {
	    			throw new Exception()
	    		}
	    	}
        } catch (e) {
        	return [ret:false, msg: 'schedule.existSchedule.message']
        }
        
        return [ret:true]
	}
}
