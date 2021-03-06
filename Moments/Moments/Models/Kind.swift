//
//  Kind.swift
//  Moments
//
//  Created by æšć„çŠ on 4/5/22.
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

        case .Life: return "đ"
        case .Work: return "đ"
        case .Love:
            return "â€ïž"
        case .Friend:
            return "đœ"
        case .Special:
            return "đ"
        case .Idol:
            return "đ„"
        case .other:
            return "đ"
        }
    }
    
    var KindName: String {
        rawValue.capitalized
    }
    
    var id: String {
        KindName
    }
}
