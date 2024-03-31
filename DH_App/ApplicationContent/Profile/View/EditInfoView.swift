//
//  EditInfoView.swift
//  DH_App
//
//  Created by Yongxiang Jin on 3/21/24.
//

import SwiftUI

struct EditInfoView: View {
    
    var body: some View {
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
    EditInfoView()
}
