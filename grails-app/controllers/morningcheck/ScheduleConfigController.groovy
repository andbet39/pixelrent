package morningcheck

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class ScheduleConfigController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond ScheduleConfig.list(params), model:[scheduleConfigCount: ScheduleConfig.count()]
    }

    def show(ScheduleConfig scheduleConfig) {
        respond scheduleConfig
    }

    def create() {
        respond new ScheduleConfig(params), model:[checks: Check.list()]
    }

    @Transactional
    def save(ScheduleConfig scheduleConfig) {
        if (scheduleConfig == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        if (scheduleConfig.hasErrors()) {
            transactionStatus.setRollbackOnly()
            respond scheduleConfig.errors, view:'create'
            return
        }

        scheduleConfig.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'scheduleConfig.label', default: 'ScheduleConfig'), scheduleConfig.id])
                redirect scheduleConfig
            }
            '*' { respond scheduleConfig, [status: CREATED] }
        }
    }

    def edit(ScheduleConfig scheduleConfig) {
        respond scheduleConfig
    }

    @Transactional
    def update(ScheduleConfig scheduleConfig) {
        if (scheduleConfig == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        if (scheduleConfig.hasErrors()) {
            transactionStatus.setRollbackOnly()
            respond scheduleConfig.errors, view:'edit'
            return
        }

        scheduleConfig.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'scheduleConfig.label', default: 'ScheduleConfig'), scheduleConfig.id])
                redirect scheduleConfig
            }
            '*'{ respond scheduleConfig, [status: OK] }
        }
    }

    @Transactional
    def delete(ScheduleConfig scheduleConfig) {

        if (scheduleConfig == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        scheduleConfig.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'scheduleConfig.label', default: 'ScheduleConfig'), scheduleConfig.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'scheduleConfig.label', default: 'ScheduleConfig'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
