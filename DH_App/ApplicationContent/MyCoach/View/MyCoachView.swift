//
//  MyCoachView.swift
//  DH_App
//
//  Created by Yongxiang Jin on 3/11/24.
//

import SwiftUI

struct MyCoachView: View {
    @StateObject var viewModel = CoachViewModel()
    @StateObject var profileViewModel = ProfileViewModel()
    
    var body: some View {
        ZStack {
            NavigationStack {
                Group {
                    switch viewModel.loadingState {
                    case .loading, .none:
                        Text("Loading Chats...")
                    case .noResults:
                        Text("No Chats...")
                    case .resultsFound:
                        List {
                            ForEach(viewModel.chats) { chat in
                                NavigationLink(value: chat.id) {
                                    VStack(alignment: .leading) {
                                        HStack {
                                            Text(chat.topic ?? "New Chat")
                                                .font(.headline)
                                            
                                            Spacer()
                                            Text(chat.model?.rawValue ?? "")
                                                .font(.caption2)
                                                .fontWeight(.semibold)
                                                .foregroundStyle(chat.model?.tintColor ?? .white)
                                                .padding(6)
                                                .background((chat.model?.tintColor ?? .white).opacity(0.1))
                                                .clipShape(Capsule(style: .continuous))
                                        }
                                        Text(chat.lastMessageTimeAgo)
                                            .font(.caption)
                                            .foregroundStyle(.gray)
                                    }
                                }
                                .onLongPressGesture {
                                    viewModel.curTitle = chat.topic ?? "New Chat"
                                    viewModel.curID = chat.id ?? ""
                                    viewModel.showEditWindow = true
                                }
                                .swipeActions { // Swipe to delete
                                    Button(role: .destructive) {
                                        viewModel.deleteChat(chat: chat)
                                    } label: {
                                        Label("Delete", systemImage: "trash.fill")
                                    }
                                }
                            }
                        }
                        .disabled(viewModel.showEditWindow)
                    }
                } // End of Group
                .blur(radius: viewModel.showEditWindow ? 5 : 0)
                .navigationTitle("Health Advisor")
                .navigationBarTitleDisplayMode(.inline)
                .toolbar(content: {
                    ToolbarItem(placement: .topBarTrailing) {
                        Button {
                            Task {
                                do {
                                    _ = try await viewModel.createChat(user: profileViewModel.currentUser?.uid)
                                } catch {
                                    print(error.localizedDescription)
                                }
                            }
                        } label: {
                            Image(systemName: "square.and.pencil")
                                .foregroundStyle(.brand)
                        }
                    }
                })
                .navigationDestination(for: String.self, destination: { chatId in
                    ChatView(viewModel: .init(chatId: chatId))
                })
                .onAppear{
                    if viewModel.loadingState == .none {
                        viewModel.fetchData(user: profileViewModel.currentUser?.uid)
                    }
                }
            }// End of Navigation Stack
            
            if viewModel.showEditWindow {
                editTitleView
            }
            
        }
        
    } // End of body
    
    
    var editTitleView: some View {
        VStack {
            VStack {
                Text("Edit Title")
                    .font(.title3)
                    .padding(.top, 10)
                TextField("New Title", text: $viewModel.curTitle)
                Divider()
                HStack(alignment: .center, spacing: 50) {
                    Button {
                        viewModel.showEditWindow = false
                    } label: {
                        Text("Cancel")
                    }
                    Divider()
                    Button { // Save the title
                        viewModel.uploadChatTitle(chatId: viewModel.curID)
                        viewModel.showEditWindow = false
                    } label: {
                        Text("Save")
                    }
                }
            }
            .padding(.horizontal, 10)
        }
        .frame(width: 300, height: 120)
        .background(Color(.white))
        .clipShape(RoundedRectangle(cornerRadius: 12))
    }
    
    
}

#Preview {
    MyCoachView()
}
