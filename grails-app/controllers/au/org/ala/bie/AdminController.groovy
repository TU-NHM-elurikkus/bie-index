package au.org.ala.bie
import au.org.ala.web.AlaSecured
import grails.converters.JSON
import grails.converters.XML

class AdminController {

    def index() {} // GSP only index

    def indexFields() {
        redirect(controller: "misc", action: "indexFields") // shouldn't get triggered due UrlMappings
    }
}
