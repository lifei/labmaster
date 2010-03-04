package labmaster.device

class Apparatus {

    String name
    String serial
    Date buyDate
    Date createDate = new Date()
    String factory
    String description 


    static constraints = {
    }

    String toString() {
        "${name} (${serial})"
    }
}
