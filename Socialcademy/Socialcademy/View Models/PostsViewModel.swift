//
//  PostsViewModel.swift
//  Socialcademy
//
//  Created by Jonathan Bigbee on 6/26/24.
//

import Foundation

@MainActor
class PostsViewModel: ObservableObject {
    @Published var posts: Loadable<[Post]> = .loading
    
    func fetchPosts() {
        Task {
            do {
                posts = .loaded(try await PostsRepository.fetchPosts())
            } catch {
                print("[PostsViewModel] Cannot fetch posts: \(error)")
                posts = .error(error)
            }
        }
    }
    
    func makeCreateAction() -> NewPostForm.CreateAction {
        return { [weak self] post in
            try await PostsRepository.create(post)
            self?.posts.value?.insert(post, at: 0)
        }
    }
}
