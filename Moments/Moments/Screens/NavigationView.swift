//
//  NavigationView.swift
//  Moments
//
//  Created by Yang Jianqi on 2022/4/1.
//

import SwiftUI

struct Navigation_View: View {
    @State private var unLocked:Bool = false
    
    
    var body: some View {
        ZStack{
            if unLocked {
                MainView()
            } else {
                OnboardingView(unLocked: $unLocked)
            }
        }
    }
}

struct Navigation_View_Previews: PreviewProvider {
    static var previews: some View {
        Navigation_View()
    }
}
