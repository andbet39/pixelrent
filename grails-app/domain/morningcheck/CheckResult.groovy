package morningcheck

class CheckResult {

    static constraints = {
    }
    static mapping = {
        sort execute_time: "desc"
    }
    String result
    Date execute_time
    Check c
    static belongsTo = Check

}
