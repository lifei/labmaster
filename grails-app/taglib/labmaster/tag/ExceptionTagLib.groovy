package labmaster.tag

class ExceptionTagLib {
    def safeOutput = { attr, body ->
        try {
            def var = attr.var?attr.var:'bean'
            out << body([(var):var])
        } catch(e) {
            println e
        }
    }
}
