//
//  ColorPicker.swift
//  Moments
//
//  Created by Yang Jianqi on 2022/4/6.
//

import SwiftUI

struct ColorPicker: View {
    @Binding var colorSelection: ColorTheme
    
    var body: some View {
        Picker("Color", selection: $colorSelection) {
            ForEach(ColorTheme.allCases) { color in
                ColorView(CT: color)
                    .tag(color)
            }
        }
    }
}

struct ColorPicker_Previews: PreviewProvider {
    static var previews: some View {
        ColorPicker(colorSelection: .constant(.C99))
    }
}
