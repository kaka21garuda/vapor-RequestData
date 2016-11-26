import Vapor

let drop = Droplet()

struct Message: NodeRepresentable {
    var title: String
    var description: String
    
    func makeNode(context: Context) throws -> Node {
        return try! Node(node: ["title": self.title, "description": self.description])
    }
    
}

drop.get("hello") { request in
    let message = Message(title: "Hello world", description: "Hello world from kaka.")
    
    return try! JSON(node: message)
}

drop.run()
