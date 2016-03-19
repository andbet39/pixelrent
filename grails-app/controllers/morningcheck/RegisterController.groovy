package morningcheck

import grails.transaction.Transactional

import static org.springframework.http.HttpStatus.CREATED
import grails.transaction.Transactional
import grails.plugin.springsecurity.annotation.Secured

@Transactional()
class RegisterController {

    static transactional = false


    def index() {
        respond new User()
    }

     def save() {

         def username = params.username
         def password = params.password
         def confirmpassword = params.confirmpassword
         def email = params.email

         log.info("New user reg " +username)
         def user  = new User(username,password,email)


         if(username =="")
         {
             flash.errors = "Username cannot be blank"
             respond user.errors, view:"index"
             return
         }
         if(email =="")
         {
             flash.errors = "Email cannot be blank"
             respond user.errors, view:"index"
             return
         }
         if(password =="")
         {
             flash.errors = "Password cannot be blank"
             respond user.errors, view:"index"
             return
         }
         if(confirmpassword !=password)
         {
             flash.errors = "Password doesn't match"
             respond user.errors, view:"index"
             return
         }


         def testUser = User.findByEmail(email)
         if(testUser)
         {
             flash.errors = "Email already used."
             respond user.errors, view:"index"
             return
         }

         testUser = User.findByUsername(username)
         if(testUser)
         {
             flash.errors = "Username already taken."
             respond user.errors, view:"index"
             return
         }

         if(user.hasErrors()){
             log.info(user.errors)
             flash.errors = user.errors.toString()
             respond user.errors, view:"index"
             return
         }

         user.save(flush:true)

         log.info(user.toString())

         if(user.id) {
             def roleUser = Role.findByAuthority('ROLE_USER')
             UserRole.create user, roleUser, true
         }

         redirect(controller: "auth", action: "login")

     }
}
