package labmaster.device

class Maintenance {

    Date createDate = new Date()
    Date modifyDate
    String description


    static belongsTo = [apparatus:Apparatus, user:labmaster.acl.User]

    static constraints = {
    }
}
