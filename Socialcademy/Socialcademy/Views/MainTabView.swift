//
//  MainTabView.swift
//  Socialcademy
//
//  Created by Jonathan Bigbee on 7/2/24.
//

import SwiftUI

struct MainTabView: View {
    @EnvironmentObject private var factory: ViewModelFactory
    
    var body: some View {
        TabView {
            NavigationView {
                PostsList(viewModel: factory.makePostsViewModel())
            }
            .tabItem {
                Label("Posts", systemImage: "list.dash")
            }
            NavigationView {
                PostsList(viewModel: factory.makePostsViewModel(filter: .favorites))
            }
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
    MainTabView()
        .environmentObject(ViewModelFactory.preview)
}
