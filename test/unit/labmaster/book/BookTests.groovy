package labmaster.book

import grails.test.*

class BookTests extends GrailsUnitTestCase {
    protected void setUp() {
        super.setUp()
    }

    protected void tearDown() {
        super.tearDown()
    }

    void testSomething() {

        Book book = new Book(name:'hehe')
        def params = [name:'呵呵呵']
        book.properties['name'] = params;

    }
}
