//
//  OptionViewHub.swift
//  DH_App
//
//  Created by Yongxiang Jin on 4/4/24.
//

import SwiftUI

struct OptionViewHub: View {
    let enumCase: ProfileOptions
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        NavigationStack {
            ZStack {
                switch enumCase {
                case .dietPlans:
                    DietPlanView()
                case .friends:
                    FriendsView()
                case .healthRecords:
                    HealthRecordsView()
                case .settings:
                    SettingsView()
                }
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button {
                        dismiss()
                    } label: {
                        Image(systemName: "chevron.backward")
                            .foregroundStyle(.brand)
                    }
                }
            }
        }

        
    }
}

#Preview {
    OptionViewHub(enumCase: .dietPlans)
}
