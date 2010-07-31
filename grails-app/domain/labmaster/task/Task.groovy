package labmaster.task

import java.util.Date;

class Task {
    // 实体定义 {{{
    /* 定义变量 {{{*/
    /** 标题 */
    String name

    /** 内容 */
    String content

    /** 目标 */
    String object

    /** 起始日期 */
    Date startDate = new Date()

    /** 截止日期 */
    Date deadline = startDate + 7

    /** 完成日期 */
    Date endDate = startDate

    /** 完成度 */
    Integer complete = 0

    /** 进展 */
    String status

    /** 更新时间 */
    Date lastUpdated
    /** 创建时间 */
    Date dateCreated
    /*}}}*/
    /* belongsTo and constraints{{{*/
    static belongsTo = [assignFrom: labmaster.auth.Member, assignTo: labmaster.auth.Member]
    static constraints = {
        name(length: 2..20, blank:false)
        content(length:2..200, widget:"textarea", blank:false)
        object(length:2..100, widget:"textarea")
        complete(range:0..100)
        assignFrom(blank:false)
        assignTo(blank:false, validator: { val, obj->
            if(!val)
            return 'blank'
            try {
                if(!obj || obj.assignFrom.id == val.id)
            return 'sameUser'
            } catch(e) {
                return 'sameUser'
            }
        })
        startDate(blank:false)
        endDate()
        deadline(blank:false, validator: { val, obj->
            try {
                if(val < obj.startDate)
            return 'wrongDeadline'
            } catch(e) {
                return 'wrongDeadline'
            }
        })
        status()
        dateCreated(nullable:true)
        lastUpdated(nullable:true)
    }/*}}}*/
    // }}}
    /* 静态函数 {{{*/

    /**
     * 获得User的全部任务<br />
     * 修改历史：      <br />
     * @param          User
     * @return         TaskList
     * @par            示例
     * @code
     * @create      2010-07-30 11:06:26
     * Task[] tasks = Task.getByUser(user);
     * @codeend
     * @author         Li Fei (mn), lifei@kuxun.cn
     */
    static Task getAllByUser(labmaster.auth.Member member) {

        return null
    }
    /*}}}*/

    String toString() {
        return this.name
    }
}

//  vim600: ts=4 st=4 foldmethod=marker foldmarker={{{,}}} syn=groovy
//  vim600: encoding=utf-8 commentstring=//\ %s
