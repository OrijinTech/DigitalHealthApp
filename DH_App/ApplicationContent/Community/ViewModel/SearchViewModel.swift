//
//  SearchViewModel.swift
//  DH_App
//
//  Created by Yongxiang Jin on 3/16/24.
//

import Foundation


class SearchViewModel: ObservableObject {
    @Published var users = [User]()
    
    init() {
        Task { try await fetchUsers() }
    }  
    
    @MainActor
    private func fetchUsers() async throws {
        self.users = try await UserServices.sharedUser.fetchUsers()
    }
    
    
}

