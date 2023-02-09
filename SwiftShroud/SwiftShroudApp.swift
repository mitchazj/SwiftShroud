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
import Dispatch

class AppDelegate: NSObject, NSApplicationDelegate {
    func application(_ application: NSApplication) -> Bool {
        print("Your code here")
        return true
    }
    
    func applicationDidFinishLaunching(_ notification: Notification) {
        // Close main app window
        if let window = NSApplication.shared.windows.first {
            window.close()
        }
        
        // Code continues here...
        print("Auto-closed window")
    }
}

@main
struct SwiftShroudApp: App {
    @NSApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    
    @State var currentNumber: String = "1"
    
    @StateObject private var appState = AppState()
    
    @Environment(\.openWindow) var openWindow
    
    init() {
        print("we made it here at least")
    }
    
    var body: some Scene {
//        WindowGroup {
//            ContentView()
//        }
        WindowGroup("Settings", id: "settings") {
            ContentView()
        }
        MenuBarExtra(currentNumber, systemImage: "\("s").circle") {
            // 3
            Button("One") {
                currentNumber = "1"
            }
            Button("Two") {
                currentNumber = "2"
            }
            Button("Three") {
                currentNumber = "3"
                openWindow(id: "settings")
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                    for window in NSApp.windows {
                        window.makeKeyAndOrderFront(nil)
                    }
                }
            }
            Divider()
            Button("Quit") {
                NSApplication.shared.terminate(nil)
            }.keyboardShortcut("q")
        }
    }
}

@MainActor
final class AppState: ObservableObject {
    init() {
        KeyboardShortcuts.onKeyUp(for: .toggleNotion) { self.toggleName(name: "Notion") }
        KeyboardShortcuts.onKeyUp(for: .toggleLinear) { self.toggleName(name: "Linear") }
        KeyboardShortcuts.onKeyUp(for: .toggleCalendar) { self.toggleName(name: "Google Calendar") }
        KeyboardShortcuts.onKeyUp(for: .toggleMail) { self.toggleName(name: "Gmail") }
        KeyboardShortcuts.onKeyUp(for: .toggleSlack) { self.toggleName(name: "Slack") }
    }
    
    func toggleName(name: String) {
        let workspace = NSWorkspace.shared
        let runningApps = workspace.runningApplications
        for app in runningApps {
            if app.localizedName == name {
                if (app.isHidden) {
                    app.activate(options: [.activateIgnoringOtherApps, .activateAllWindows])
                } else {
                    app.hide()
                }
                break
            }
        }
    }
}
