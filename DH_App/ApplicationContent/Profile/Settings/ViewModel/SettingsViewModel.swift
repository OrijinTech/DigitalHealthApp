//
//  SettingsViewModel.swift
//  DH_App
//
//  Created by Yongxiang Jin on 4/5/24.
//

import SwiftUI


enum SettingsOptions: Int, CaseIterable, Identifiable {
    var id: Int { return self.rawValue }
    
    case option1
    case option2
    case option3
    case option4
    
    
    var title: LocalizedStringKey {
        switch self {
        case .option1:
            return "Option1"
        case .option2:
            return "Option2"
        case .option3:
            return "Option3"
        case .option4:
            return "Option4"
        }
    }
    
}
