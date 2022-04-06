//
//  HeartGroupView.swift
//  Moments
//
//  Created by Yang Jianqi on 2022/4/1.
//

import SwiftUI

struct HeartGroupView: View {
    @State private var isAnimating: Bool = false
    
    var body: some View {
        ZStack{
            HeartView(heartScale: 1.5, heartColor: Color.red)
            HeartView(heartScale: 2.0, heartColor: Color("OurPink"))
        }
        .blur(radius: isAnimating ? 0 : 10)
        .opacity(isAnimating ? 1 : 0)
        .scaleEffect(isAnimating ? 1 : 0)
        .animation(.easeOut(duration: 1), value: isAnimating)
        .onAppear {
            isAnimating = true
        }
    }
}

struct HeartGroupView_Previews: PreviewProvider {
    static var previews: some View {
        HeartGroupView()
    }
}
