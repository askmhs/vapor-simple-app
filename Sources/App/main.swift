import Vapor

let drop = Droplet()

drop.get { request in
    return try JSON(node: [
        "message": "Hello, Vapor!"
    ])
}

drop.get("hello") { request in
    return try JSON(node: [
        "message": "Hello, again!"
    ])
}

drop.get("hello", "again") { request in
    return try JSON(node: [
        "message": "I'm tired to say hello!"
    ])
}

drop.get("hello", String.self) { request, name in
    return try JSON(node: [
        "message": "Hello, " + name + "!"
    ])
}

drop.post("post") { request in
    guard let name = request.data["name"]?.string else {
        throw Abort.badRequest
    }
    
    return try JSON(node: [
        "message": "Hello, \(name)!"
    ])
}

drop.run()
