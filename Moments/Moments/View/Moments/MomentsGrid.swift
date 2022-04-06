//
//  MomentsGrid.swift
//  Moments
//
//  Created by Yang Jianqi on 2022/4/1.
//

import SwiftUI

struct MomentsGrid: View {
    var moment: Moment
    @State private var SlideWidth: Double = UIScreen.main.bounds.width
    @State private var fontsize: CGFloat = 15
    
    var body: some View {
        ZStack(alignment: .bottom) {
            Image(uiImage: UIImage(contentsOfFile: moment.imageURL) ?? UIImage(named: moment.img)!)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .cornerRadius(15)
                .padding(4)
            HStack {
                Text(moment.mood.moodImg)
                    .padding(10)
                    
                Spacer()
                Text(date2string(Datestr: moment.dd))
                    .padding(10)
                    
            }
            .frame(height:30)
            .foregroundColor(.white)
            .background(.ultraThinMaterial)
        }
        .background(.ultraThinMaterial)
        .cornerRadius(15)
    }
}

struct MomentsGrid_Previews: PreviewProvider {
    static var previews: some View {
        MomentsGrid(moment: Moment.sampleData[0])
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
