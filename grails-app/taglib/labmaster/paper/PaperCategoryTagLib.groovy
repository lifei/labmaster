package labmaster.paper

class PaperCategoryTagLib {

    def showSubCategory = {attrs, body -> 
        def id = attrs.id

        PaperCategory.findAll("from PaperCategory where parentId=?", [id]).each { cat ->
            out << body(category:cat)
        }
    }

}
