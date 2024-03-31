//
//  OtherUserView.swift
//  DH_App
//
//  Created by Yongxiang Jin on 3/15/24.
//

import SwiftUI

struct OtherUserView: View {
    let user: User
    @StateObject var viewModel = ProfileViewModel()
    @Environment(\.dismiss) var dismiss
    
    private var curUser: User? {
        return viewModel.currentUser
    }
    
    
    var body: some View {
        ScrollView {
            VStack(spacing: 60) {
                
                ProfileHeaderView(user: user)
                    .padding(.top, 20)
                
                if user == curUser {
                    Button { // TODO: Share Profile Button
                        
                    } label: {
                        Text("Share Profile")
                            .font(.subheadline)
                            .fontWeight(.semibold)
                            .foregroundStyle(.white)
                            .frame(width: 352, height: 32)
                            .background(.brand)
                            .clipShape(RoundedRectangle(cornerRadius: 8))
                    }
                } else {
                    Button { // TODO: Follow Button
                        
                    } label: {
                        Text("Follow")
                            .font(.subheadline)
                            .fontWeight(.semibold)
                            .foregroundStyle(.white)
                            .frame(width: 352, height: 32)
                            .background(.brand)
                            .clipShape(RoundedRectangle(cornerRadius: 8))
                    }
                }

                // User content list view
                ThreadList(user: user)
                
            }
        }
        .padding(.horizontal)
        .scrollIndicators(.hidden)
        .navigationBarBackButtonHidden()
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Button {
                    dismiss()
                } label: {
                    HStack {
                        Image(systemName: "chevron.backward")
                            .foregroundStyle(.brand)
                    }
                }
            }
        }
    }
}

#Preview {
    OtherUserView(user: User.MOCK_USER)
}



