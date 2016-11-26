import Vapor

let drop = Droplet()

drop.get("hello") { request in
    return "hello world"
}

drop.run()
