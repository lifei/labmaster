dataSource {
    pooled = true
    driverClassName = "com.mysql.jdbc.Driver"
    dbCreate = "update"
    url = "jdbc:mysql://localhost/labmaster?useUnicode=true&characterEncoding=UTF-8"
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
            driverClassName = "org.hsqldb.jdbcDriver"
            dbCreate = "update"
            url = "jdbc:hsqldb:db/testDb;shutdown=true"
        }
    }
    test {
        dataSource {
            pooled = true
            driverClassName = "org.hsqldb.jdbcDriver"
            dbCreate = "update"
            url = "jdbc:hsqldb:db/testDb;shutdown=true"
        }
    }
    production {
        dataSource {
            pooled = true
            driverClassName = "com.mysql.jdbc.Driver"
            username = "root"
            password = ""
            dbCreate = "update"
            url = "jdbc:mysql://localhost/labmaster?useUnicode=true&characterEncoding=UTF-8"
            properties {
                maxActive = 50
                maxIdle = 25
                minIdle = 5
                initialSize = 5
                minEvictableIdleTimeMillis = 100000
                timeBetweenEvictionRunsMillis = 100000
                maxWait = 100000        
            }    
        }
    }
}
