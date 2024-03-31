//
//  ThreadList.swift
//  DH_App
//
//  Created by Yongxiang Jin on 3/18/24.
//

import SwiftUI

struct ThreadList: View {
    
    @StateObject var viewModel: UserThreadsViewModel
    @State private var selectedFilter: ProfileThreadFilter = .threads //selected tab
    @Namespace var animation
    
    private var filterBarWidth: CGFloat { // Dynamic filter bar width
        let count = CGFloat(ProfileThreadFilter.allCases.count) // number of cases
        return UIScreen.main.bounds.width / count - 30 // total width of each tab width, and 20 padding
    }
    
    init(user: User) {
        self._viewModel = StateObject(wrappedValue: UserThreadsViewModel(user: user))
    }
    
    var body: some View {
        VStack {
            HStack {
                ForEach(ProfileThreadFilter.allCases) { filter in
                    VStack {
                        Text(filter.title)
                            .font(.subheadline)
                            .fontWeight(selectedFilter == filter ? .semibold : .regular)
                        
                        if selectedFilter == filter {
                            Rectangle()
                                .foregroundStyle(.black)
                                .frame(width: filterBarWidth, height: 1)
                                .matchedGeometryEffect(id: "item", in: animation) // make the transition smooth
                        } else {
                            Rectangle()
                                .foregroundStyle(.clear)
                                .frame(width: filterBarWidth, height: 1)
                        }
                    }
                    .onTapGesture {
                        withAnimation(.spring()) {
                            selectedFilter = filter
                        }
                    }
                }
            }
            
            LazyVStack {
                ForEach(viewModel.threads) { thread in
                    ThreadCell(thread: thread)
                }
            }
        }
        .padding(.vertical, 8)
    }
}


#Preview {
    ThreadList(user: User.MOCK_USER)
}
