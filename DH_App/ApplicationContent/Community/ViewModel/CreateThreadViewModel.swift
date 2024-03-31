//
//  CreateThreadViewModel.swift
//  DH_App
//
//  Created by Yongxiang Jin on 3/17/24.
//

import Foundation
import Firebase

class CreateThreadViewModel: ObservableObject {
    
    @Published var postContent = ""
    
    
    func uploadThread() async throws {
        guard let uid = Auth.auth().currentUser?.uid else { return }
        let thread = Thread(ownerUid: uid, postContent: postContent, timestamp: Timestamp(), likes: 0)
        try await ThreadServices.uploadThread(thread)
    }
    
    
}
