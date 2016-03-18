import morningcheck.UserRole

class BootStrap {

    def socketService

    def init = { servletContext ->

        socketService.start()

      /*  def userRole = UserRole.findByAuthority('ROLE_USER') ?: new UserRole(authority: 'ROLE_USER').save(failOnError: true)
        def adminRole = UserRole.findByAuthority('ROLE_ADMIN') ?: new UserRole(authority: 'ROLE_ADMIN').save(failOnError: true)
        def moderatorRole = UserRole.findByAuthority('ROLE_MODERATOR') ?: new UserRole(authority: 'ROLE_MODERATOR').save(failOnError: true)
*/
    }
    def destroy = {
    }
}
