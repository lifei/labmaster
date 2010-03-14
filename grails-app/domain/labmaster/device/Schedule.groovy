package labmaster.device

class Schedule {
	
	Date date
	Integer beginTime
	Integer endTime
	Date dateCreated
	Date lastUpdated
	
	static belongsTo = [apparatus:Apparatus, user:labmaster.auth.Member]

    static constraints = {
		beginTime(range:0..24)
		endTime(range:0..24)
		date(blank:false)
        dateCreated(nullable:true)
        lastUpdated(nullable:true)
    }
	
	
	def isValid() {
		
		if(beginTime >= endTime) {
			return [ret:false, msg: 'schedule.wrongtime.message']
		}
		
		// 查找所有仪器和日期相付的记录
        def schedules = Schedule.findAll("from Schedule as b where b.apparatus=:apparatus and date=:date",
        		[apparatus:apparatus, date:date])
        		
        		
        beginTime = (beginTime as int)
        endTime = (endTime as int)
        
        try {
	        // 验证每条记录
	    	schedules.each {
	        	// 交叉
	    		if((beginTime >= it.beginTime && beginTime < it.endTime)  
					|| ( endTime > it.beginTime && endTime <= it.endTime)) {
	    			throw new Exception()
	    		}
	    		
	    		// 包含
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
