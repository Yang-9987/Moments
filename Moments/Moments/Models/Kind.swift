//
//  Kind.swift
//  Moments
//
//  Created by 杨健琦 on 4/5/22.
//

import Foundation
import SwiftUI

enum Kind: String, CaseIterable, Identifiable, Codable {
    case Life
    case Work
    case Love
    case Friend
    case Special
    case Idol
    case other
    
    var KindImg: String {
        switch self {

        case .Life: return "🛋"
        case .Work: return "🗄"
        case .Love:
            return "❤️"
        case .Friend:
            return "🍽"
        case .Special:
            return "🌟"
        case .Idol:
            return "🥁"
        case .other:
            return "📝"
        }
    }
    
    var KindName: String {
        rawValue.capitalized
    }
    
    var id: String {
        KindName
    }
}
