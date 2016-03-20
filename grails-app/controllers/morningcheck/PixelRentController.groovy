package morningcheck
import grails.plugin.springsecurity.annotation.Secured
import grails.transaction.Transactional

import static org.springframework.http.HttpStatus.CREATED
import java.util.HashMap;
import java.util.Map;

import com.stripe.Stripe;
import com.stripe.exception.StripeException;
import com.stripe.model.Charge;
import com.stripe.net.RequestOptions;


class PixelRentController {

    def springSecurityService


    def index() {}

    def main(){
        
    }

    def mass(){


        def query = Space.where {
            ( expire_date > new Date() )
        }

        def spaces = query.list()

        def total_space =0
        def active_space =0
        for(space in spaces){
            total_space += space.size_x*space.size_y
            active_space++;
        }

          respond spaces, model:[spaceCount: active_space,total_space:total_space]


    }

    @Secured("ROLE_USER")
    def renew(Space space){

        def amount = space.size_y*space.size_x

        def order = new Order(space: space,amount:amount,created: new Date(),owner:springSecurityService.currentUser,status: "CREATED")

       /* if(order.hasErrors()){
            log.info(order.errors.toString())
        }*/
        order.save(flush: true)

        redirect(controller: "cusSpace", action:"checkout",id:order.id)
    }



    @Secured("ROLE_USER")
    def charge(){

        def order = Order.findById(params.id)
        def space = order.space
        def token = params.stripeToken


        Stripe.apiKey = "sk_test_vkLyPOI6CcWC2xtrSa2r90up";

        def  amount  = space.size_x*space.size_y

        log.info("amount " + amount)

        Map<String, Object> chargeParams = new HashMap<String, Object>();
            chargeParams.put("amount", amount); // amount in cents, again
            chargeParams.put("currency", "usd");
            chargeParams.put("source", token);
            chargeParams.put("description", "Example charge");

            Charge charge = Charge.create(chargeParams);

            order.status ="PAID"
            order.paid_on =new Date()

            if( space.expire_date > new Date()) {
                space.expire_date = space.expire_date + 30
            }else{
                space.expire_date = new Date() + 30
            }

            space.paid=true;
            space.save(flush:true);
            order.save(flush:true)



        redirect(action: "myspaces" )

    }


    @Secured("ROLE_USER")
    def myspaces(){
        def user = springSecurityService.currentUser

        def spaceList = Space.findAllByOwner(user)

        respond spaceList

    }
}
