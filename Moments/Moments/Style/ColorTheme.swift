//
//  ColorTheme.swift
//  Moments
//
//  Created by 杨健琦 on 4/5/22.
//

import SwiftUI

enum ColorTheme: String, CaseIterable, Identifiable, Codable {
    case C99
    case C98
    case C97
    case C96
    case C95
    case C94
    case C93
    case C92
    case C91
    case C90
    case C89
    case C88
    case C87
    
    var accentColor: Color {
        switch self {
        case .C99, .C98, .C97, .C96, .C95, .C87, .C89, .C88:
            return .white
        case .C94, .C93, .C92, .C91, .C90:
            return .black
        }
    }
    var mainColor: Color {
        Color(rawValue)
    }
    var name: String {
        rawValue.capitalized
    }
    var id: String {
        name
    }
}
