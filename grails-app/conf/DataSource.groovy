dataSource {
    pooled = true
    driverClassName = "com.mysql.jdbc.Driver"
    dialect = org.hibernate.dialect.MySQL5InnoDBDialect
    username = "collectory"
    password = "password"
    logSql = false
    dbCreate = "update"
    url = "jdbc:mysql://localhost:3306/collectory"
    properties {
        jmxEnabled = true
        initialSize = 5
        maxActive = 50
        minIdle = 5
        maxIdle = 25
        maxWait = 10000
        maxAge = 10 * 60000
        timeBetweenEvictionRunsMillis = 5000
        minEvictableIdleTimeMillis = 60000
        validationQuery = "/* ping */"  // Better than "SELECT 1"
        validationQueryTimeout = 3
        validationInterval = 15000
        testOnBorrow = true
        testWhileIdle = true
        testOnReturn = false
        jdbcInterceptors = "ConnectionState;StatementCache(max=200)"
        defaultTransactionIsolation = java.sql.Connection.TRANSACTION_READ_COMMITTED
        ignoreExceptionOnPreLoad = true

        // controls for leaked connections
        abandonWhenPercentageFull = 100 // settings are active only when pool is full
        removeAbandonedTimeout = 120
        removeAbandoned = true

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
