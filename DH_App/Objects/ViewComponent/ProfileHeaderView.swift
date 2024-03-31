//
//  ProfileHeaderView.swift
//  DH_App
//
//  Created by Yongxiang Jin on 3/16/24.
//

import SwiftUI

struct ProfileHeaderView: View {
    var user: User?
    
    init(user: User?) {
        self.user = user
    }
    
    var body: some View {
        HStack(alignment: .top) {
            VStack(alignment: .leading, spacing: 20) {
                Text(user?.userName ?? "User Name")
                    .font(.title2)
                    .fontWeight(.semibold)
                if let desc = user?.description {
                    Text(desc)
                        .font(.subheadline)
                } else {
                    Text(LocalizedStringKey("The user is lazy"))
                        .font(.subheadline)
                }
                
                
                Text("\(user?.followerNum ?? 0) Followers")
                    .font(.caption)
                    .foregroundStyle(Color(.gray))
            }
            
            Spacer()
            
            CircularProfileImageView(user: user, width: 40, height: 40, showCircle: false)
        }
    }
}

#Preview {
    ProfileHeaderView(user: User.MOCK_USER)
}
