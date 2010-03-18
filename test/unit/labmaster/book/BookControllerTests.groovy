package labmaster.book

import grails.test.*

class BookControllerTests extends ControllerUnitTestCase {
    protected void setUp() {
        super.setUp()
    }

    protected void tearDown() {
        super.tearDown()
    }

    void testSomething() {
        def p = new BookController()
        p.params.name = '你好'
        p.params.id = 1
        p.update()

    }
}
