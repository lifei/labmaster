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
		
		// 列出本台仪器当天所有预定的记录
        def schedules = Schedule.findAll("from Schedule as b where b.apparatus=:apparatus and date=:date",
        		[apparatus:apparatus, date:date])
        		
        		
        beginTime = (beginTime as int)
        endTime = (endTime as int)
        
        try {
	        // 说明已经存在有预定记录，摒弃存在的冲突        
	    	schedules.each {
	        	// 有交叉的情况
	    		if((beginTime >= it.beginTime && beginTime < it.endTime) // 开始时间冲突
					|| ( endTime > it.beginTime && endTime <= it.endTime)) {// 结束时间冲突
	    			throw new Exception()
	    		}
	    		
	    		// 包含的情况
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
