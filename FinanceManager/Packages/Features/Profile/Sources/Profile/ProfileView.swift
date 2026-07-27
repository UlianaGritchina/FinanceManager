//
//  ProfileView.swift
//  Profile
//
//  Created by Ульяна Гритчина on 26.07.2026.
//

import SwiftUI
import ProfileDomain

struct ProfileView: View {
    @State private var viewModel: ProfileViewModel
    
    init(viewModel: ProfileViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        VStack {
            if let profile = viewModel.profileInfo {
                Text(profile.userName)
            }
            
            Button(action: { viewModel.crateAccountButtonPressed() }) {
                Text("Crate account")
            }
        }
    }
}
