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
            properties {
                maxActive = 50
                maxIdle = 25
                minIdle = 5
                initialSize = 5
                minEvictableIdleTimeMillis = 10000
                timeBetweenEvictionRunsMillis = 10000
                maxWait = 10000
            }    
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
