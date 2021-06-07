import Foundation

final class CallStation {
    var usersArray: [User] = []
    var callsArray: [Call] = []
}

extension CallStation: Station {
    func users() -> [User] {
        return usersArray
    }
    
    func add(user: User) {
        if usersArray.contains(user) {
            print("User \(user) already exits")
        } else {
            usersArray.append(user)
        }
    }
    
    func remove(user: User) {
        let index = usersArray.firstIndex(where: {$0.id == user.id})
        if index != nil {
            usersArray.remove(at: index!)
        }
        
    }
    
    func execute(action: CallAction) -> CallID? {
        switch action {
        case .start(from: let user1, to: let user2):
            if usersArray.contains(user1) {
                if usersArray.contains(user2) {
                    var call = Call(id: UUID(), incomingUser: user1, outgoingUser: user2, status: .calling)
                    for element in callsArray {
                        if element.outgoingUser == user2 && (element.status == .talk || element.status == .calling) {
                            call.status = .ended(reason: .userBusy)
                        }
                        
                    }
                    
                    callsArray.append(call)
                    return call.id
                } else {
                    let call = Call(id: UUID(), incomingUser: user1, outgoingUser: user2, status: .ended(reason: .error))
                    callsArray.append(call)
                    return call.id
                }
            } else {
                return nil
            }
        case .answer(from: let outcomingUser):
            if usersArray.contains(outcomingUser) {
                print(callsArray)
                var i = 0
                for call in callsArray {
                    if call.incomingUser == outcomingUser || call.outgoingUser == outcomingUser {
                        if call.status == .calling {
                            callsArray[i].status = .talk
                            return call.id
                        }
                    }
                    i += 1
                }
            } else {
                return nil
            }
        case .end(from: let user):
            var i = 0
            for call in callsArray {
                if call.incomingUser == user || call.outgoingUser == user {
                    if call.status == .calling {
                        callsArray[i].status = .ended(reason: .cancel)
                        return call.id
                    } else if call.status == .talk {
                        callsArray[i].status = .ended(reason: .end)
                        return call.id
                    }
                }
                i += 1
            }
        }
        return nil
    }
    
    func calls() -> [Call] {
        return callsArray
    }
    
    func calls(user: User) -> [Call] {
        var array: [Call] = []
        for call in callsArray {
            if call.incomingUser == user || call.outgoingUser == user {
                array.append(call)
            }
        }
        return array
    }
    
    func call(id: CallID) -> Call? {
        for element in callsArray {
            if element.id == id {
                return element
            }
        }
        return nil
    }
    
    func currentCall(user: User) -> Call? {
        for element in callsArray {
            if element.incomingUser == user || element.outgoingUser == user {
                if element.status == .calling || element.status == .talk {
                    return element
                }
            }
        }
        return nil
    }
}
