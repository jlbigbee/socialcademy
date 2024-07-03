//
//  ProfileView.swift
//  Socialcademy
//
//  Created by Jonathan Bigbee on 7/3/24.
//

import SwiftUI
import FirebaseAuth

struct ProfileView: View {
    var body: some View {
        Button("Sign Out", action: {
            try! Auth.auth().signOut()
        })
    }

}

#Preview {
    ProfileView()
}
