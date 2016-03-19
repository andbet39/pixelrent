package morningcheck

class UrlMappings {

    static mappings = {
        "/$controller/$action?/$id?(.$format)?"{
            constraints {
                // apply constraints here
            }
        }

        "/"(controller: "pixelRent",action: "mass")
        "500"(view:'/error')
        "404"(view:'/notFound')
    }
}
