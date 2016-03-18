package morningcheck

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional
import grails.plugin.springsecurity.annotation.Secured

@Transactional(readOnly = true)
class DatabaseController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]
    @Secured("ROLE_USER")
    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Database.list(params), model:[databaseCount: Database.count()]
    }

    @Secured("ROLE_ADMIN")
    def show(Database database) {
        respond database
    }

    @Secured("ROLE_ADMIN")
    def create() {
        respond new Database(params)
    }

    @Transactional
    def save(Database database) {
        if (database == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        if (database.hasErrors()) {
            transactionStatus.setRollbackOnly()
            respond database.errors, view:'create'
            return
        }

        database.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'database.label', default: 'Database'), database.id])
                redirect database
            }
            '*' { respond database, [status: CREATED] }
        }
    }

    @Secured("ROLE_ADMIN")
    def edit(Database database) {
        respond database
    }

    @Transactional
    @Secured("ROLE_ADMIN")
    def update(Database database) {
        if (database == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        if (database.hasErrors()) {
            transactionStatus.setRollbackOnly()
            respond database.errors, view:'edit'
            return
        }

        database.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'database.label', default: 'Database'), database.id])
                redirect database
            }
            '*'{ respond database, [status: OK] }
        }
    }

    @Transactional
    @Secured("ROLE_ADMIN")
    def delete(Database database) {

        if (database == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        database.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'database.label', default: 'Database'), database.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'database.label', default: 'Database'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
