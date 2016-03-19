package morningcheck

import grails.converters.JSON
import grails.transaction.Transactional
import grails.plugin.springsecurity.annotation.Secured
import org.springframework.web.multipart.commons.CommonsMultipartFile
import org.imgscalr.Scalr

import javax.imageio.ImageIO
import java.awt.image.BufferedImage

import static org.springframework.http.HttpStatus.CREATED

class CusSpaceController {

    def springSecurityService
    def imageService
    def index() {}

    @Secured("ROLE_USER")
    def newspace(){
        respond new Space(params)
    }

    @Transactional
    @Secured("ROLE_USER")
    def save(Space space) {

        space.owner = springSecurityService.currentUser


        def image = request.getFile('file')

        ByteArrayInputStream bis = new ByteArrayInputStream(image.getBytes());
        ByteArrayOutputStream bos = new ByteArrayOutputStream();

        BufferedImage bimage = ImageIO.read(bis);

        BufferedImage resizedImage = Scalr.resize(bimage, Scalr.Method.AUTOMATIC,
                Scalr.Mode.FIT_TO_WIDTH, space.size_x, Scalr.OP_ANTIALIAS);

        ImageIO.write(resizedImage, "jpg", bos);



        def new_img_data=  bos.toByteArray();


        space.image=new_img_data
        space.expire_date = new Date()

        log.info(params.toString())

        space.save flush:true

        def amount = space.size_x*space.size_y;

        def order = new Order(space: space,amount:amount,created: new Date(),owner:springSecurityService.currentUser,status: "CREATED")

        if(order.hasErrors()){
            log.info(order.errors.toString())
        }
        order.save(flush: true)

        respond order , [formats:[ 'json']]

    }

    def showPayload(Space space){

            response.outputStream << space.image
            response.outputStream.flush()

    }

    @Secured("ROLE_USER")
    def checkout(Order order){

        respond order
    }
}
