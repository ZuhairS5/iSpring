//
//  SideMenuViewModel.swift
//  iSpring
//
//  Created by Samhith Sripada on 2022-06-06.
//

import Foundation
import SwiftUI

enum SideMenuViewModel: Int, CaseIterable {
    
    case profileOption
    case topicsAndPeopleOption
    case verifyAccountOption
    case settingsOption
    case helpOption
    case signOutOption
    
    var title: String {
        switch self {
            case .profileOption: return "Profile"
            case .topicsAndPeopleOption: return "Topics & People"
            case .verifyAccountOption: return "Verify Account"
            case .settingsOption: return "Settings"
            case .helpOption: return "Help & Tutorials"
            case .signOutOption: return "Sign Out"
        }
    }
    
    var imageName: String {
        switch self {
            case .profileOption: return "person.circle.fill"
            case .topicsAndPeopleOption: return "network"
            case .verifyAccountOption: return "person.crop.circle.fill.badge.checkmark"
            case .settingsOption: return "gearshape.fill"
            case .helpOption: return "questionmark.circle.fill"
            case .signOutOption: return "arrow.backward.square.fill"
        }
    }
    
}
