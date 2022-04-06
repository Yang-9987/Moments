//
//  RowImage.swift
//  We
//
//  Created by Yang Jianqi on 2022/3/24.
//

import Foundation
import SwiftUI

extension Image {
    func RowImage() -> some View {
        self
            .resizable()
            .aspectRatio(contentMode: .fill)
            .clipShape(Circle())
    }
}
