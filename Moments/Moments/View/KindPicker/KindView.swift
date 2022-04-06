//
//  KindView.swift
//  Moments
//
//  Created by Yang Jianqi on 2022/4/6.
//

import SwiftUI

struct KindView: View {
    let kind: Kind
    
    var body: some View {
        HStack {
            Text(kind.KindImg)
            Text(kind.KindName)
        }
        .padding(4)
    }
}

struct KindView_Previews: PreviewProvider {
    static var previews: some View {
        KindView(kind: .Love)
    }
}
