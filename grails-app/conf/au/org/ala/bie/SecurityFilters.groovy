package au.org.ala.bie

/**
 * Generated by the Shiro plugin. This filters class protects all URLs
 * via access control by convention.
 */
class SecurityFilters {
    def filters = {
        all(uri: "/admin/**") {
            before = {
                // Access control by convention.
                accessControl()
            }
        }

        all(uri: "/import/**") {
            before = {
                // Access control by convention.
                accessControl()
            }
        }
    }
}
