//
//  MomentsRow.swift
//  Moments
//
//  Created by Yang Jianqi on 2022/4/1.
//

import SwiftUI

struct MomentsRow: View {
    var moment: Moment
    
    var body: some View {
        HStack {
            Image(uiImage: UIImage(contentsOfFile: moment.imageURL) ?? UIImage(named: moment.img)!)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 70, height: 70, alignment: .center)
                .clipShape(Circle())
                .overlay {
                    Circle().stroke(.gray, lineWidth: 2)
                }
                .shadow(radius: 3)
            
            VStack(alignment: .leading, spacing: 5) {
                Text(moment.title)
                    .font(.system(size: 17, weight: .bold))
                HStack {
                    Text(moment.mood.moodImg)
                        .font(.system(size: 12))
                    Text(date2string(Datestr: moment.dd))
                        .font(.system(size: 12, weight: .light))
                }
            }
            
            Spacer()
            
            if moment.isFavorite {
                Image(systemName: "star.fill")
                    .foregroundColor(Color("OurPink"))
                    .padding(.horizontal, 10)
            }
        }
        .frame(height:80)
    }
}

struct MomentsRow_Previews: PreviewProvider {
    static var previews: some View {
        MomentsRow(moment: Moment.sampleData[0])
            .previewLayout(.sizeThatFits)
    }
}
