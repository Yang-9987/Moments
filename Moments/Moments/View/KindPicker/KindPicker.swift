//
//  KindPicker.swift
//  Moments
//
//  Created by Yang Jianqi on 2022/4/6.
//

import SwiftUI

struct KindPicker: View {
    @Binding var kindselection: Kind
    
    var body: some View {
        Picker("Kind", selection: $kindselection) {
            ForEach(Kind.allCases) { kind in
                KindView(kind: kind)
                    .tag(kind)
            }
        }
    }
}

struct KindPicker_Previews: PreviewProvider {
    static var previews: some View {
        KindPicker(kindselection: .constant(.Love))
    }
}
