//
//  ColorView.swift
//  Moments
//
//  Created by Yang Jianqi on 2022/4/6.
//

import SwiftUI

struct ColorView: View {
    let CT: ColorTheme
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 4)
                .fill(CT.mainColor)
            Label(CT.name,systemImage: "paintpalette")
        }
        .foregroundColor(CT.accentColor)
        .fixedSize(horizontal: false, vertical: true)
    }
}

struct ColorView_Previews: PreviewProvider {
    static var previews: some View {
        ColorView(CT: .C99)
    }
}
