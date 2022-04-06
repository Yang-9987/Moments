//
//  iconRightLabel.swift
//  We
//
//  Created by Yang Jianqi on 2022/3/24.
//

import Foundation
import SwiftUI


struct iconRightLabel: LabelStyle {
    func makeBody(configuration: Configuration) -> some View {
        HStack {
            configuration.title
            configuration.icon
        }
    }
}
