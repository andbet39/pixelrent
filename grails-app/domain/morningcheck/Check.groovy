package morningcheck

class Check {
    static mapping = {
        table 'checks'
    }

    static constraints = {
        query  widget: 'textarea'
    }
    static hasMany = [checkresults: CheckResult]

    Database db
    static belongsTo = Database

    //static belongsTo = Database
    String name
    String description
    String query

}
