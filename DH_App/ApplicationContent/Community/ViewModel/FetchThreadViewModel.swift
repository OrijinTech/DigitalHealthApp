//
//  FetchViewModel.swift
//  DH_App
//
//  Created by Yongxiang Jin on 3/18/24.
//

import Foundation


@MainActor
class FetchThreadViewModel: ObservableObject {
    @Published var threads = [Thread]()
    
    
    init() {
        Task{ try await fetchThreads() }
    }
    
    
    func fetchThreads() async throws {
        self.threads = try await ThreadServices.fetchThreads()
        try await fetchThreadUser()
    }
    

    private func fetchThreadUser() async throws {
        for i in 0 ..< threads.count {
            let thread = threads[i]
            let ownerUid = thread.ownerUid
            print("OWNER UID: \(ownerUid)")
            let threadUser = try await UserServices.fetchUser(with: ownerUid)
            print(threadUser)
            threads[i].user = threadUser
        }
    }
    
}

