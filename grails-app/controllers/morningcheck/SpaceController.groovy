package morningcheck

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class SpaceController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Space.list(params), model:[spaceCount: Space.count()]
    }

    def show(Space space) {
        respond space
    }

    def create() {
        respond new Space(params)
    }

    @Transactional
    def save(Space space) {
        if (space == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        if (space.hasErrors()) {
            transactionStatus.setRollbackOnly()
            respond space.errors, view:'create'
            return
        }

        space.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'space.label', default: 'Space'), space.id])
                redirect space
            }
            '*' { respond space, [status: CREATED] }
        }
    }

    def edit(Space space) {
        respond space
    }

    @Transactional
    def update(Space space) {
        if (space == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        if (space.hasErrors()) {
            transactionStatus.setRollbackOnly()
            respond space.errors, view:'edit'
            return
        }

        space.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'space.label', default: 'Space'), space.id])
                redirect space
            }
            '*'{ respond space, [status: OK] }
        }
    }

    @Transactional
    def delete(Space space) {

        if (space == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        space.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'space.label', default: 'Space'), space.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'space.label', default: 'Space'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
