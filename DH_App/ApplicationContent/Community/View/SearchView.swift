//
//  SearchView.swift
//  DH_App
//
//  Created by Yongxiang Jin on 3/15/24.
//

import SwiftUI

struct SearchView: View {
    @StateObject var viewModel = SearchViewModel()
    @State private var searchText = ""
    private let prompt: LocalizedStringKey = "Search"
    @Environment(\.dismiss) var dismiss
    
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack {
                    LazyVStack {
                        ForEach(viewModel.users) { user in
                            NavigationLink(value: user) {
                                VStack {
                                    UserCell(user: user)
                                    Divider()
                                }
                                .padding(.vertical, 5)
                            }
                        }
                    }
                }
            }
            .navigationDestination(for: User.self, destination: { user in
                OtherUserView(user: user)
            })
            .navigationTitle(prompt)
            .searchable(text: $searchText, prompt: prompt)
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button(LocalizedStringKey("Cancel")) {
                        dismiss()
                    }
                    .padding(.vertical, 10)
                    .font(.subheadline)
                    .foregroundStyle(.brand)
                }
            }
        } // End of Navigation Stack
    }
}

#Preview {
    SearchView()
}
