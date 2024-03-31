//
//  UserThreadsViewModel.swift
//  DH_App
//
//  Created by Yongxiang Jin on 3/18/24.
//


// View Model for Threads of the users

import Foundation

class UserThreadsViewModel: ObservableObject {
    @Published var threads = [Thread]()
    
    let user: User
    
    init(user: User ) {
        self.user = user
        Task{ try await fetchUserThreads() }
    }
    
    @MainActor
    func fetchUserThreads() async throws {
        var threads = try await ThreadServices.fetchUserThreads(uid: user.id)
        // Set user data for each thread
        for i in 0 ..< threads.count {
            threads[i].user = self.user
        }
        
        self.threads = threads
    }
    
}
