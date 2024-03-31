//
//  CreateThread.swift
//  DH_App
//
//  Created by Yongxiang Jin on 3/15/24.
//

import SwiftUI

struct CreateThreadView: View {
    @StateObject var viewModel = CreateThreadViewModel()
    @Environment(\.dismiss) var dismiss
    
    private var user: User? {
        // Through .sharedUser, we can access the current user anywhere in the application and not pass down through the hierarchy
        return UserServices.sharedUser.currentUser
    }
    
    var body: some View {
        NavigationStack {
            VStack {
                HStack(alignment: .top){
                    CircularProfileImageView(user: user, width: 40, height: 40, showCircle: false)
                    VStack(alignment: .leading, spacing: 4) {
                        Text(user?.userName ?? "no username")
                            .fontWeight(.semibold)
                        TextField(LocalizedStringKey("Start the post... "), text: $viewModel.postContent, axis: .vertical)
                    }
                    .font(.footnote)
                    
                    Spacer()
                    
                    if !viewModel.postContent.isEmpty {
                        Button {
                            viewModel.postContent = ""
                        } label: {
                            Image(systemName: "xmark")
                                .resizable()
                                .frame(width: 12, height: 12)
                                .foregroundStyle(.brand)
                        }
                    }
                    
                }
                
                Spacer()
                
            }
            .padding()
            .navigationTitle(LocalizedStringKey("New Post"))
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button(LocalizedStringKey("Cancel")) {
                        dismiss()
                    }
                    .font(.subheadline)
                    .foregroundStyle(.brand)
                }
                
                ToolbarItem(placement: .topBarTrailing) {
                    Button(LocalizedStringKey("Post")) {
                        Task { try await viewModel.uploadThread() }
                        dismiss()
                    }
                    .opacity(viewModel.postContent.isEmpty ? 0.5 : 1.0)
                    .disabled(viewModel.postContent.isEmpty)
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .foregroundStyle(.brand)
                }
            }
        }
    }
}

#Preview {
    CreateThreadView()
}
