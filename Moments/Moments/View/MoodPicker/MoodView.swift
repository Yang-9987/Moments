//
//  MoodView.swift
//  OurStory
//
//  Created by Yang Jianqi on 2022/3/16.
//

import SwiftUI

struct MoodView: View {
    let moods: Mood
    
    var body: some View {
        ZStack{
            RoundedRectangle(cornerRadius: 4)
                .fill(.cyan)
            HStack {
                Text(moods.moodName)
                Text(moods.moodImg)
            }
            .padding(4)
        }
        //.foregroundColor(.white)
        .fixedSize(horizontal: false, vertical: true)
    }
}

struct MoodView_Previews: PreviewProvider {
    static var previews: some View {
        MoodView(moods: .Happy)
    }
}
