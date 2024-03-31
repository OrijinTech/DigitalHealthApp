//
//  Thread.swift
//  DH_App
//
//  Created by Yongxiang Jin on 3/15/24.
//

import SwiftUI

struct ThreadCell: View {
    let thread: Thread
    
    var body: some View {
        VStack {
            HStack(alignment: .top, spacing: 12){
                CircularProfileImageView(user: thread.user, width: 40, height: 40, showCircle: false)
                VStack(alignment: .leading, spacing: 4) {
                    HStack {
                        Text(thread.user?.userName ?? "no username")
                            .font(.footnote)
                            .fontWeight(.semibold)
                        Spacer()
                        Text(thread.timestamp.timestampString())
                            .font(.caption)
                            .foregroundStyle(Color(.systemGray3))
                        Button {
                            
                        } label: {
                            Image(systemName: "ellipsis")
                                .foregroundStyle(Color(.darkGray))
                        }
                    }
                    Text(thread.postContent)
                        .font(.footnote)
                        .multilineTextAlignment(.leading)
                    
                    HStack(spacing: 16) {
                        Button {
                            
                        } label: {
                            Image(systemName: "heart")
                        }
                        Button {
                            
                        } label: {
                            Image(systemName: "bubble.left")
                        }
                        Button {
                            
                        } label: {
                            Image(systemName: "star")
                        }
                        Button {
                            
                        } label: {
                            Image(systemName: "paperplane")
                        }
                    }
                    .foregroundStyle(.black)
                    .padding(.vertical, 8)
                }
            } // End of H Stack
            Divider()
        } // End of V Stack
        .padding()
    }
}

#Preview {
    ThreadCell(thread: Thread.MOCK_THREAD)
}
