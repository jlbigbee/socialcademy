//
//  SocialcademyApp.swift
//  Socialcademy
//
//  Created by Jonathan Bigbee on 6/25/24.
//

import SwiftUI
import Firebase

@main
struct SocialcademyApp: App {
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
