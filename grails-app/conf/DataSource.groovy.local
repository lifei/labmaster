dataSource {
    pooled = true
    driverClassName = "com.mysql.jdbc.Driver"
    username = "root"
    password = "kooxoo"
    dbCreate = "create-drop"
    url = "jdbc:mysql://localhost/crawler"
}
hibernate {
    cache.use_second_level_cache=true
    cache.use_query_cache=true
    cache.provider_class='net.sf.ehcache.hibernate.EhCacheProvider'
}
// environment specific settings
environments {
    development {
        dataSource {
            pooled = true
            driverClassName = "com.mysql.jdbc.Driver"
            username = "root"
            password = ""
            dbCreate = "update"
            url = "jdbc:mysql://localhost/labmaster?useUnicode=true&characterEncoding=UTF-8"
        }
    }
    test {
        dataSource {
            pooled = true
            driverClassName = "com.mysql.jdbc.Driver"
            username = "root"
            password = ""
            dbCreate = "update"
            url = "jdbc:mysql://localhost/labmaster?useUnicode=true&characterEncoding=UTF-8"
        }
    }
    product {
        dataSource {
            pooled = true
            driverClassName = "com.mysql.jdbc.Driver"
            username = "root"
            password = ""
            dbCreate = "update"
            url = "jdbc:mysql://localhost/labmaster?useUnicode=true&characterEncoding=UTF-8"
        }
    }
}
