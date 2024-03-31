//
//  EditInfoView.swift
//  DH_App
//
//  Created by Yongxiang Jin on 3/15/24.
//

import SwiftUI

struct EditInfoView: View {
    @State private var link = ""
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color(.systemGroupedBackground)
                    .ignoresSafeArea(edges: [.bottom, .horizontal] )
                
                VStack {
                    Text("Change Username")
                        .fontWeight(.semibold)
                    Spacer()
                    TextField(LocalizedStringKey("Enter New Username"), text: $link, axis: .vertical)
                    Divider()
                        .padding(.bottom, 150)

                }
                .padding()
                .background(.white)
                .clipShape(RoundedRectangle(cornerRadius: 10))
                .overlay {
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color(.systemGray4), lineWidth: 1)
                }
                .padding(.horizontal)
                .padding(.vertical, 200)
            }
            .navigationTitle(LocalizedStringKey("Edit Profile")) // TODO: This should change based on which info you want to change
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button("Cancel") {
                        
                    }
                    .font(.subheadline)
                    .foregroundStyle(.brand)
                }
                
                ToolbarItem(placement: .topBarTrailing) {
                    Button("Save") {
                        
                    }
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .foregroundStyle(.brand)
                }
            }
        }
    }
}

#Preview {
    EditInfoView()
}
