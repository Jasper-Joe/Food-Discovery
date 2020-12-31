//
//  DBManager.swift
//  Food Discovery
//
//  Created by Jinglun Zhou on 2020/12/29.
//

import Foundation
import FirebaseDatabase

public class DBManager {
    static let shared = DBManager()
    private let db = Database.database().reference()
    
    public func canCreateNewUser(with email:String, username: String, completion: (Bool) -> Void) {
        completion(true)
    }
    
    // completion: Async callback for result
    // Escaping Closure: An escaping closure is a closure that's called after the function it was passed to returns.
    // It outlives the function it was passed to.
    public func insertNewUser(with email: String, username: String, completion: @escaping (Bool) -> Void) {
        db.child(email.convertEmail()).setValue(["username": username]) { error, _ in
            if error == nil {
                completion(true)
                return
            } else {
                completion(false)
                return
            }
            
        }
    }
    
    

    
}
