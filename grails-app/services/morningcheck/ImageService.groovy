package morningcheck

import grails.transaction.Transactional

import javax.imageio.ImageIO
import java.awt.image.BufferedImage
import org.imgscalr.Scalr
import grails.plugin.springsecurity.annotation.Secured

@Transactional
class ImageService {

    def serviceMethod() {

    }
    @Secured("ROLE_USER")
    def resize(byte[] imageData, int size_x) {

        ByteArrayInputStream bis = new ByteArrayInputStream(imageData);

        BufferedImage image = ImageIO.read(bis);

        BufferedImage resizedImage = Scalr.resize(image, Scalr.Method.AUTOMATIC,
                calr.Mode.FIT_TO_WIDTH, size_x, Scalr.OP_ANTIALIAS);
        ImageIO.write(resizedImage, "jpg", bos);

        return DATA_IMAGE + DatatypeConverter.printBase64Binary(bos.toByteArray());


    }
    @Secured("ROLE_USER")
    def testmethod(){
        log.info("test");
    }
}
