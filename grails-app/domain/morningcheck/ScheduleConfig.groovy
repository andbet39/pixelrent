package morningcheck

class ScheduleConfig {

    static constraints = {
    }

    static mapping = {
        is_paused defaultValue: false
        is_started defaultValue :true
        is_repeating defaultValue:true
        rpt_int_min defaultValue:10

    }

    Check check
    boolean is_paused
    boolean is_started
    boolean is_repeating
    int n_execution
    int rpt_int_min

}
