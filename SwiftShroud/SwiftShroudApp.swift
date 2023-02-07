//
//  SwiftShroudApp.swift
//  SwiftShroud
//
//  Created by Mitchell Johnson on 6/2/2023.
//

import SwiftUI
import Carbon
import Cocoa
import KeyboardShortcuts

@main
struct SwiftShroudApp: App {
    @StateObject private var appState = AppState()
    
    init() {
        print("we made it here at least")
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}

@MainActor
final class AppState: ObservableObject {
    init() {
        KeyboardShortcuts.onKeyUp(for: .toggleUnicornMode) { [self] in
            print("the keyboard shortcut was hit")
        }
    }
}
