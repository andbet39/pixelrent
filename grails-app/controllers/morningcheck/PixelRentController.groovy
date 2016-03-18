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

    }

    @Secured("ROLE_USER")
    def newspace(){
        respond new Space(params)
    }

    @Transactional
    @Secured("ROLE_USER")
    def save(Space space) {
        def user = springSecurityService.currentUser
        space.owner = user

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

        redirect(action: "checkout", id: space.id)


    }

    @Secured("ROLE_USER")
    def charge(){

        def space = Space.findById(params.id)
     def token = params.stripeToken

        log.info("Received token "+ token)

        Stripe.apiKey = "sk_test_vkLyPOI6CcWC2xtrSa2r90up";

            def  amount  = space.size_x*space.size_y

        log.info("amount " + amount)

        Map<String, Object> chargeParams = new HashMap<String, Object>();
            chargeParams.put("amount", amount); // amount in cents, again
            chargeParams.put("currency", "usd");
            chargeParams.put("source", token);
            chargeParams.put("description", "Example charge");

            Charge charge = Charge.create(chargeParams);

            space.paid=true;
            space.save(flush:true);



        redirect(action: "myspaces" )

    }


    @Secured("ROLE_USER")
    def myspaces(){
        def user = springSecurityService.currentUser

        def spaceList = Space.findAllByOwner(user)

        respond spaceList

    }
}
