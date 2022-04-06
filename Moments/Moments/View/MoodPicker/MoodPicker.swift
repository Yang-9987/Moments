//
//  MoodPicker.swift
//  OurStory
//
//  Created by Yang Jianqi on 2022/3/16.
//

import SwiftUI

struct MoodPicker: View {
    @Binding var selection: Mood
    
    var body: some View {
        Picker("Mood",selection: $selection) {
            ForEach(Mood.allCases) { mood in
                MoodView(moods: mood)
                    .tag(mood)
            }
        }
    }
}

struct MoodPicker_Previews: PreviewProvider {
    static var previews: some View {
        MoodPicker(selection: .constant(.Happy))
    }
}
