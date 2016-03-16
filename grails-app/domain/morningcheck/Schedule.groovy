package morningcheck

class Schedule {

    static constraints = {
    }

    static mapping = {

        end_date nullable: true
        start_date nullable: true
        status nullable: true

    }
    static belongsTo = [conf:ScheduleConfig,check:Check]

    Check check
    String status
    Date start_date
    Date end_date
    ScheduleConfig conf
}
