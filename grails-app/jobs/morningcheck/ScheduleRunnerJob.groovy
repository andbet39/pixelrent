package morningcheck

class ScheduleRunnerJob {

    def engineService

    static triggers = {
        simple name: 'BrokerTrigger', startDelay: 0, repeatInterval: 1500000
    }

    def execute() {
        log.info("ScheduleRunnerJob Execution ")
        engineService.runSchedule()
        log.info("ScheduleRunnerJob Execution done")
    }

}
