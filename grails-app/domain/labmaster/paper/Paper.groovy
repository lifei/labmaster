package labmaster.paper
import org.grails.rateable.*

class Paper implements Rateable {

    Long id
    String title = ''
    String keywords = ''
    String author = ''
    String label = ''
    String abstruct = ''
    String notes = ''
    String url = ''
    String filename = ''
    String affiliation = ''
    
    int year = 2000
    String journal = ''
    String volume = ''
    String issue = ''
    String pages = ''
    String issn = ''
    String doi = ''

    int status = 0

    static constraints = {
    }
}
