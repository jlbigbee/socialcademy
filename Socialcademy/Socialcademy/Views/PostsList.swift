//
//  PostsList.swift
//  Socialcademy
//
//  Created by Jonathan Bigbee on 6/26/24.
//

import SwiftUI

struct PostsList: View {
    private var posts = [Post.testPost]
    
    var body: some View {
        NavigationView {
            List(posts) { post in
                PostRow(post: post)
            }
            .navigationTitle("Posts")
        }
    }
}

#Preview {
    PostsList()
}
