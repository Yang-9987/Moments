//
//  Mood.swift
//  Moments
//
//  Created by Yang Jianqi on 2022/4/1.
//

import Foundation
import SwiftUI

enum Mood: String, CaseIterable, Identifiable, Codable {
    case Happy
    case Sad
    case Bored
    case Afraid
    case Surprised
    case Depressed
    case Confused
    case Nervous
    case Angry
    case Sleepy
    case Tear
    case Warm
    case Love
    case KissKiss
    case HappyBirthday
    case ExtremlyAngry
    case Chaos
    case Cold
    case What
    case ill
    
    var moodImg: String {
        switch self {
        case .Happy: return "π"
        case .Sad: return "π"
        case .Bored: return "π"
        case .Afraid: return "π±"
        case .Surprised: return "π²"
        case .Depressed: return "π"
        case .Confused: return "π§"
        case .Nervous: return "π"
        case .Angry: return "π‘"
        case .Sleepy: return "π΄"
        case .Tear: return "π₯Ή"
        case .Warm: return "βΊοΈ"
        case .Love: return "π₯°"
        case .KissKiss: return "π"
        case .HappyBirthday: return "π₯³"
        case .ExtremlyAngry: return "π€¬"
        case .Chaos: return "π€―"
        case .Cold: return "π₯Ά"
        case .What: return "π"
        case .ill: return "π€"
        }
    }
    
    var moodName: String {
        rawValue.capitalized
    }
    
    var id: String {
        moodName
    }
}
