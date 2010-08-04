package labmaster.weekly

class WeeklyReport {
    // 实体定义 <++>

    // 实体字段 <++>
    /** 年份 */
    Integer year

    /** 星期数 */
    Integer week
    // <-->

    static constraints = {
        year(min:2009,max:2010)
        week(min:1,max:60)
    }

    // <-->
}

// vim600: ts=4 st=4 foldmethod=marker foldmarker=<++>,<--> syn=groovy
// vim600: encoding=utf-8 commentstring=//\ %s
