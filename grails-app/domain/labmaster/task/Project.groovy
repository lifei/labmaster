package labmaster.task

class Project {
    // 实体 {{{
    /** 名称 */
    String name
    String description

    static belongsTo = [leader: labmaster.auth.Member]
    static hasMany = [members: labmaster.auth.Member, plans: Plan]

    /** 更新时间 */
    Date dateCreated
    Date lastUpdated
    static constraints = {
        name(length:2..20,blank:false)
        description(length:2..200, widget:"textarea",blank:false)
        leader()
        members()
        plans()
        dateCreated(nullable:true)	
        lastUpdated(nullable:true)
    }
    // }}}
    // 静态函数接口 {{{
    // getListByMembers() {{{
    static def getListByMembers(def user) {
        return getAllByMembers(user)
    }

    static def getAllByMembers(def user) {
        /*
        return Project.findAll( "from Project p join p.members m where ? in m", [user])
         */

        def projects = Project.list()

        return projects.findAll { proj ->
            proj.members.any{ it.id==user.id }
        }
    }
    // }}}
    // getListByUser() {{{
    static def getListByUser(def user) {
        return getAllByUser(user)
    }

    static def getListByUser(def user, def params) {
        return getAllByUser(user, params)
    }

    static def getAllByUser(def user) {
        /* modified at 2010-07-31 13:12:10: 考虑到兼容性和可扩展性 
           return Project.executeQuery(
           "select a from Project as a inner join a.members as b where :user=b or a.leader=:user group by a",
           [user:user])
         */
        def list = Project.executeQuery(
            "select a from Project as a inner join a.members as b where :user=b or a.leader=:user",
            [user:user])

            return list.unique()
            // 使用面向对象的思想实现的，但是效率较差{{{
            /* 面向对象的实现方法
            def projectsOfMember = Project.getAllByMembers(user);
            def projectsOfAdmin = Project.findAllByLeader(user);

            def list = new java.util.HashSet<Project>()

            projectsOfMember.each {
            list.add(it)
            }

            projectsOfAdmin.each {
            list.add(it)
            }

            list = list.unique{ 
            it?it.id:0
            }

            list.remove(null)

            return list
             */
            // }}}
    }

    static def getAllByUser(def user, def params) {
        def list = Project.executeQuery(
            "select a from Project as a inner join a.members as b where :user=b or a.leader=:user",
            [user:user], params)

            return list.unique()
    }
    // }}}
    // getListByLeader() {{{
    // }}}
    // {{{
    static def getListWithoutUser(def user) {
        def list = Project.executeQuery("select a from Project as a inner join a.members as b where :user!=b and a.leader!=:user", [user:user])
        return list
    }
    // }}}
    // }}}

    static def getProjectCountByUser(def user) {
        def cnt = Project.executeQuery(
            "select count(*) from Project as a inner join a.members as b where :user=b or a.leader=:user",
            [user:user])

        return cnt?cnt[0]:0
    }
    String toString() {
        "${name}"
    }

}
