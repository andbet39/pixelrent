package morningcheck

class Order {

    static constraints = {
        paid_on(nullable:true)

    }

    static mapping = {
        table 'sp_ord'

    }
    User owner
    Space space
    Date created
    float amount

    Date paid_on
    String status
}
