//
//  Timestamp.swift
//  DH_App
//
//  Created by Yongxiang Jin on 3/18/24.
//

import Foundation
import Firebase

extension Timestamp {
    
    func timestampString() -> String {
        let formatter = DateComponentsFormatter()
        formatter.allowedUnits = [.second, .minute, .hour, .day, .weekOfMonth]
        formatter.maximumUnitCount = 1
        formatter.unitsStyle = .abbreviated
        return formatter.string(from: self.dateValue(), to: Date()) ?? ""
    }
    
}
