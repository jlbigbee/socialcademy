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
        TabView {
            PostsList()
                .tabItem {
                    Label("Posts", systemImage: "list.dash")
                }
            PostsList(viewModel: PostsViewModel(filter: .favorites))
                .tabItem {
                    Label("Favorites", systemImage: "heart")
                }
            ProfileView()
                .tabItem {
                    Label("Profile", systemImage: "person")
                }
        }
    }

}

#Preview {
    ProfileView()
}
