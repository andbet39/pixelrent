package morningcheck

import grails.transaction.Transactional

import static org.springframework.http.HttpStatus.CREATED

class RegisterController {

    static transactional = false


    def index() {
        respond new User()
    }

     def save() {

        def username = params.username
         def password = params.password

         log.info("New user reg " +username)
        //def user =  new User(username:username,password: password).save()
        def user  = User.findOrCreateByUsernameAndPassword(username,password).save(flush:true)

         log.info(user.toString())

         def roleUser = Role.findByAuthority('ROLE_USER')

         UserRole.create user, roleUser, true

         redirect(controller: "auth", action: "login")

     }
}
