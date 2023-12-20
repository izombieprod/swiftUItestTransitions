//
//  testTransitionsApp.swift
//  testTransitions
//
//  Created by Roman Chervonyak on 20.12.2023.
//

import SwiftUI

@main
struct testTransitionsApp: App {
    @StateObject var coordinator: Coordinator = .shared
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(coordinator)
        }
    }
}
