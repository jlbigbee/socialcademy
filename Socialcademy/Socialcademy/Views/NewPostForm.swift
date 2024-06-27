//
//  NewPostForm.swift
//  Socialcademy
//
//  Created by Jonathan Bigbee on 6/26/24.
//

import SwiftUI

struct NewPostForm: View {
    @Environment(\.dismiss) private var dismiss

    @State private var post = Post(title: "", content: "", authorName: "")
    @State private var state = FormState.idle
    
    typealias CreateAction = (Post) async throws -> Void

    let createAction: CreateAction
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Title", text: $post.title)
                    TextField("Author Name", text: $post.authorName)
                }
                Section("Content") {
                    TextEditor(text: $post.content)
                        .multilineTextAlignment(.leading)
                }
                Button(action: createPost) {
                    Text("Create Post")
                }
                .font(.headline)
                .frame(maxWidth: .infinity)
                .foregroundColor(.white)
                .padding()
                .listRowBackground(Color.accentColor)
            }
            .onSubmit(createPost)
            .navigationTitle("New Post")
        }
    }
    
    private func createPost() {
        Task {
            state = .working
            do {
                try await createAction(post)
                dismiss()
            } catch {
                print("[NewPostForm] Cannot create post: \(error)")
                state = .error
            }
        }
    }
}


private extension NewPostForm {
    enum FormState {
        case idle, working, error
    }
}
#Preview {
    NewPostForm(createAction: { _ in })
}
