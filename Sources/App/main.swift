import Vapor

let drop = Droplet()

struct Message: NodeRepresentable {
    var title: String
    var description: String
    
    func makeNode(context: Context) throws -> Node {
        return try! Node(node: ["title": self.title, "description": self.description])
    }
    
}

drop.post("create") { request in
    guard let firstname = request.data["firstname"]?.string else {
        throw Abort.badRequest
    }
    
    guard let secondname = request.data["secondname"]?.string else {
        throw Abort.badRequest
    }
    
    return try! JSON(node: [
            "firstname": "\(firstname)",
            "secondname": "\(secondname)"
    ])
}

drop.get("hello") { request in
    let message = Message(title: "Hello world", description: "Hello world from kaka.")
    let anotherMessage = Message(title: "what's up!", description: "Greetings!")
    
    return try! JSON(node: [message, anotherMessage])
}

drop.run()
