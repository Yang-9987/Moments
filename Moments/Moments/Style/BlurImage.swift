//
//  BlurImage.swift
//  OurStory
//
//  Created by Yang Jianqi on 2022/3/11.
//

import SwiftUI

struct BlurImage: View {
    var image: Image
    
    var body: some View {
        image
            .resizable()
            .aspectRatio(contentMode: .fit)
            .blur(radius: 5)
            .frame(height: 300)
    }
}

struct BlurImage_Previews: PreviewProvider {
    static var previews: some View {
        BlurImage(image: Image("Snow_1"))
    }
}
