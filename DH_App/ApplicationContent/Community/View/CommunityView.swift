//
//  CommunityView.swift
//  DH_App
//
//  Created by Yongxiang Jin on 3/11/24.
//

import SwiftUI

struct CommunityView: View {
    @StateObject var viewModel = FetchThreadViewModel()
    @State private var selectedButton = 0
    @State private var showCreateThread = false
    @State private var showSearch = false
    private let navBarTitle: LocalizedStringKey = "COMMUNITY"
    
    var body: some View {
        NavigationStack {
            ScrollView(){
                LazyVStack {
                    ForEach(viewModel.threads) { thread in
                        ThreadCell(thread: thread)
                    }
                }
            }
            .refreshable { // Refresh the threads
                Task { try await viewModel.fetchThreads() }
            }
            .navigationTitle(navBarTitle)
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        selectedButton = 1
                    } label: {
                        Image(systemName: "plus")
                            .foregroundStyle(.brand)
                            .padding(.trailing, 8)
                    }
                }
                
                ToolbarItem(placement: .topBarLeading) {
                    Button {
                        selectedButton = 2
                    } label: {
                        Image(systemName: "magnifyingglass")
                            .foregroundStyle(.brand)
                            .padding(.leading, 8)
                    }
                }
            }
            .onChange(of: selectedButton, { oldValue, newValue in
                showCreateThread = selectedButton == 1
                showSearch = selectedButton == 2
            })
            .sheet(isPresented: $showCreateThread, onDismiss: {
                selectedButton = 0
            }, content: {
                CreateThreadView()
            })
            .fullScreenCover(isPresented: $showSearch, onDismiss: {
                selectedButton = 0
            }, content: {
                SearchView()
            })
            
            
        } // End of Navigation Stack

        
    }
}

#Preview {
    CommunityView()
}
