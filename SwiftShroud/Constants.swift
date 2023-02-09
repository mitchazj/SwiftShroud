//
//  Constants.swift
//  SwiftShroud
//
//  Created by Mitchell Johnson on 8/2/2023.
//

import Foundation
import KeyboardShortcuts

extension KeyboardShortcuts.Name {
    static let toggleNotion = Self("toggleNotion", default: .init(.n, modifiers: [.option, .shift]))
    static let toggleLinear = Self("toggleLinear", default: .init(.l, modifiers: [.option, .shift]))
    
    static let toggleCalendar = Self("toggleCalendar", default: .init(.k, modifiers: [.option, .shift]))
    static let toggleMail = Self("toggleMail", default: .init(.m, modifiers: [.option, .shift]))
    
    static let toggleSlack = Self("toggleSlack", default: .init(.p, modifiers: [.option, .shift]))
}
