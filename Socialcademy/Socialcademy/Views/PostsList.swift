//
//  PostsList.swift
//  Socialcademy
//
//  Created by Jonathan Bigbee on 6/26/24.
//

import SwiftUI

struct PostsList: View {
    @StateObject var viewModel = PostsViewModel()
    
    @State private var searchText = ""
    @State private var showNewPostForm = false
    
    private let posts = [Post.testPost]
    
    var body: some View {
        NavigationView {
            Group {
                switch viewModel.posts {
                case .loading:
                    ProgressView()
                case .error(_):
                    Text("Cannot Load Posts")
                case .empty:
                    Text("No Posts")
                case let .loaded(posts):
                    List(posts) { post in
                        if searchText.isEmpty || post.contains(searchText) {
                            PostRow(post: post)
                        }
                    }
                    .searchable(text: $searchText)
                }
            }
            .navigationTitle("Posts")
            .toolbar {
                Button {
                    showNewPostForm = true
                } label: {
                    Label("New Post", systemImage: "square.and.pencil")
                }
            }
            .sheet(isPresented: $showNewPostForm) {
                NewPostForm(createAction: viewModel.makeCreateAction())
            }
        }
        .onAppear {
            viewModel.fetchPosts()
        }
    }
}

#Preview {
    PostsList()
}
