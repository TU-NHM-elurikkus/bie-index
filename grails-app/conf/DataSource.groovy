dataSource {
    pooled = true
    driverClassName = "com.mysql.jdbc.Driver"
    dialect = org.hibernate.dialect.MySQL5InnoDBDialect
    logSql = false
    dbCreate = "update"
    url = "jdbc:mysql://localhost:3306/collectory"
    properties {
        jmxEnabled = true

        maxActive = 50
        maxIdle = 25
        minIdle = 5
        initialSize = 5
        minEvictableIdleTimeMillis = 60000
        timeBetweenEvictionRunsMillis = 60000
        maxWait = 10000

        validationQuery = "/* ping */"  // Better than "SELECT 1"
        testOnBorrow = true
        testOnReturn = true
        testWhileIdle = true

        dbProperties {
            autoReconnect = false
            connectTimeout = 60000
        }
    }
}

hibernate {
    cache.use_second_level_cache = true
    cache.use_query_cache = true
    cache.provider_class = "net.sf.ehcache.hibernate.EhCacheProvider"
}

// environment specific settings
environments {
    development {
        dataSource {

        }
    }

    test {
        dataSource {

        }
    }

    production {
        dataSource {

        }
    }
}
