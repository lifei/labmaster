package labmaster.paper

class Paper {

    @Id
    Long id
    String title
    String keywords
    String author
    String label
    String abstruct
    String notes
    String researchNotes
    String url
    String filename
    String authorAddress
    String figure
    String caption
    String translatedAuthor
    String translatedTitle
    
    int year
    String journal
    String volume
    String issue
    String page
    String pages
    String startPage
    Date pubDate
    String issn
    String doi
    String accessionNumber

    static constraints = {
    }
}
