package lifei.util

class JFilterTagLib {

    def showFilterBox = { attr, body ->

        if(!attr.field)
            return

        if(attr.field.size() == 0)
            return

        int fieldCount = attr.field.size()

        attr.field.each {
            if(params."${it}" && params."${it}" != 'disable') {
                fieldCount--
            }
        }

        if(fieldCount < 1)
            return

        out << "<div id=\"filter\" class=\"filter\">"

        out << '''
                <div class="filter-title">
                    筛选 
                    <a id="fold" href="javascript:void(0);">[展开]</a>
                    <a id="filter-help-button" href="javascript:void(0);" onmouseover="javascript:$j('#filter-help').show();" onmouseout="javascript:$j('#filter-help').hide();">[?]</a>
                    <div style="display: none;" id="filter-help" class="filter-help">
                        <ul>
                            <li>鼠标点击<strong>文字</strong>过滤。</li>
                            <li>多项条件过滤只需<strong>重复多次</strong>过滤过程。</li>
                        </ul>
                    </div>
                </div>
            '''
       out << "<form>"
       out << body()
       out << "<span id=\"filter-button\" value=\"过滤\" name=\"filter\"> </span>"
       out << "</form></div>"
    }

    def fieldFitler = { attr, body ->
        if(!attr.field)
            return

        if(!attr.value)
            return

        if(attr.value.size() == 0)
            return

        def paramsValue = params."${attr.field}"

        if(paramsValue && attr.value.contains(paramsValue))
            return

        out << "<div class=\"findByHint\">按"
        out << message(code:"${controllerName}.filter.${attr.field}", default:'序号')
        out << "：</div>"

        out << "<div class=\"subCategoryBox\">"

        boolean first = true
        attr.value.each {
            if(it == 'customize')
                return
            out << "<div class=\"radioBox\">"
            out << link(params:[:]+params+[(attr.field):it], 
                    message(code:"${controllerName}.filter.${attr.field}.${it}", default:it)) 
            out << "</div>"
        }

        if(body) {
            out << "<div class=\"radioBox\">"
            out << body()
            out << "</div>"
        }
        out << "</div>"
    }

    def filterCssAndJavascript = { attr ->


        out << javascript(library:"jquery/jquery-1.3.2.min")
        out << "<link rel=\"stylesheet\" href=\"${resource(dir:'css',file:'filter.css')}\" />"

        if(attr.field && attr.field.size() > 0) {

            int fieldCount = attr.field.size()

            attr.field.each {
                if(params."${it}" && params."${it}" != 'disable') {
                    fieldCount--
                }
            }

            if(fieldCount > 0 && fieldCount < attr.field.size())
                out << "<script> var fold = 'open'; </script>"
        } else 
            out << "<script> var fold = 'open'; </script>"

        out << javascript(library:"util/filter")
    }

    def filterTipBox = { attr, body->

        if(!attr.field)
            return

        if(attr.field.size() == 0)
            return

        int fieldCount = attr.field.size()

        attr.field.each {
            if(!params."${it}" || !(params[it] instanceof String) || params."${it}" == 'disable') {
                fieldCount--
            }
        }

        if(fieldCount < 1)
            return

        out << '''
            <div id="filter-tip" class="filter">
                <div class="filter-title">
                    筛选条件
            '''
        out << "<a href=\"${createLink(action:actionName)}\">[清空所有条件]</a>"

        out << '''
                    <a id="filter-result-help-button" href="javascript:void(0);"
                    onmouseover="javascript:$j('#filter-resutl-help').show();"
                    onmouseout ="javascript:$j('#filter-resutl-help').hide();"
                    >[?]</a>
                    <div id="filter-resutl-help" class="filter-help">

                        <ul>
                            <li>鼠标点击蓝框内链接移除对该项过滤。</li>
                        </ul>
                    </div>
                </div>
                <center>
            '''

        attr.field.each {
            if(params."${it}" && params."${it}" != 'disable') {
                def p = [:]
                params.each { k,v ->
                    if(!k.startsWith(it)) {
                        p += [(k):v]
                    }
                }

                if(params."${it}" == 'customize') {
                    if(attr.customize && attr.customize."${it}") {
                        out << link(action:actionName, params:p,
                            message(code:"${controllerName}.filter.${it}.${params[it]}",
                            args:[attr.customize."${it}"],
                            default:params."${it}"))
                    }
                    else {
                        out << link(action:actionName, params:p,
                            '错误的过滤条件')
                    }
                }
                else if(params[it] instanceof String)
                    out << link(action:actionName, params:p,
                        message(code:"${controllerName}.filter.${it}.${params[it]}",
                        default:"${params[it]}"))
            }
        }

        out << "</center>"
        out << "</div>"
            


    }

}
