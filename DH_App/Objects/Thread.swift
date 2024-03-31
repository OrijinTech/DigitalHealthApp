//
//  ThreadModel.swift
//  DH_App
//
//  Created by Yongxiang Jin on 3/17/24.
//

// DATA MODEL OF A THREAD

import Foundation
import Firebase
import FirebaseFirestoreSwift


struct Thread: Identifiable, Codable {
    @DocumentID var threadId: String?
    let ownerUid: String
    let postContent: String
    let timestamp: Timestamp //Firebase timestamp
    var likes: Int
    
    var id: String {
        return threadId ?? NSUUID().uuidString
    }
    var user: User?
    
    
    
}


extension Thread {
    static let MOCK_THREAD = Thread(ownerUid: "123", postContent: "Test post content", timestamp: Timestamp(), likes: 0)
}
