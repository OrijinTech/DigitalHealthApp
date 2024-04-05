//
//  SettingsView.swift
//  DH_App
//
//  Created by Yongxiang Jin on 4/4/24.
//

import SwiftUI

struct SettingsView: View {
    var body: some View {
        NavigationStack {
            List {
                Section(LocalizedStringKey("Settings Section 1")) {
                    ForEach(SettingsOptions.allCases) { option in
                        Text(option.title)
                            .padding(.vertical, 8)
                    }
                }
                
                Section(LocalizedStringKey("Settings Section 2")) {
                    ForEach(SettingsOptions.allCases) { option in
                        Text(option.title)
                            .padding(.vertical, 8)
                    }
                }
                
            }
            .listStyle(.grouped)
            .navigationTitle(LocalizedStringKey("Settings"))
            .navigationBarTitleDisplayMode(.inline)
        }
        
    }
}

#Preview {
    SettingsView()
}
