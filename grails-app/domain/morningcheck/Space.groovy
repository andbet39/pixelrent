package morningcheck
import grails.rest.*

 class Space {

    static constraint = {
       pos_x(nullable:true)
       pos_y(nullable:true)
       expire_date(nullable:true)
       image(nullable:true, maxSize: 1024 * 1024 * 2 /* 2MB */)
      // pos_y(nullable:true)
    }

    int pos_x
    int pos_y
    int size_x
    int size_y
    String img_url
    String ad_link
    User owner
    boolean paid
    Date expire_date

    byte[] image


}
