//
//  ProfileThreadFilter.swift
//  DH_App
//
//  Created by Yongxiang Jin on 3/15/24.
//

import Foundation
import SwiftUI

enum ProfileThreadFilter: Int, CaseIterable, Identifiable{
    case threads
    case replies
    
    
    var title: LocalizedStringKey {
        switch self{
        case .threads: return "Threads"
        case .replies: return "Replies"
        }
    }
    
    var id: Int { return self.rawValue }
    
}

