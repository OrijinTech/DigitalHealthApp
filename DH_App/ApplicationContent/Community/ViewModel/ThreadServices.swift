//
//  ThreadServices.swift
//  DH_App
//
//  Created by Yongxiang Jin on 3/17/24.
//

import Foundation
import Firebase
import FirebaseFirestoreSwift


struct ThreadServices {
    
    
    static func uploadThread(_ thread: Thread) async throws {
        guard let threadData = try? Firestore.Encoder().encode(thread) else { return }
        try await Firestore.firestore().collection(Collection().threads).addDocument(data: threadData)
    }
    
    
    static func fetchThreads() async throws -> [Thread] {
        let snapshot = try await Firestore.firestore().collection(Collection().threads).order(by: "timestamp", descending: true).getDocuments()
        return snapshot.documents.compactMap({ try? $0.data(as: Thread.self) })
    }
    
    static func fetchUserThreads(uid: String) async throws -> [Thread] {
        let snapshot = try await Firestore.firestore().collection(Collection().threads).whereField("ownerUid", isEqualTo: uid).getDocuments()
        let threads = snapshot.documents.compactMap({ try? $0.data(as: Thread.self) })
        return threads.sorted(by: {$0.timestamp.dateValue() > $1.timestamp.dateValue() }) // Manual sorting due to .whereField()
    }
    
}

