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
        case .Happy: return "😄"
        case .Sad: return "🙁"
        case .Bored: return "😐"
        case .Afraid: return "😱"
        case .Surprised: return "😲"
        case .Depressed: return "😞"
        case .Confused: return "🧐"
        case .Nervous: return "😕"
        case .Angry: return "😡"
        case .Sleepy: return "😴"
        case .Tear: return "🥹"
        case .Warm: return "☺️"
        case .Love: return "🥰"
        case .KissKiss: return "😘"
        case .HappyBirthday: return "🥳"
        case .ExtremlyAngry: return "🤬"
        case .Chaos: return "🤯"
        case .Cold: return "🥶"
        case .What: return "🙄"
        case .ill: return "🤒"
        }
    }
    
    var moodName: String {
        rawValue.capitalized
    }
    
    var id: String {
        moodName
    }
}
