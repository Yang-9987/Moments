//
//  SpecialDayRow.swift
//  Moments
//
//  Created by 杨健琦 on 4/5/22.
//

import SwiftUI

struct SpecialDayRow: View {
    var sp: SpecialDays
    
    var body: some View {
        HStack{
            VStack {
                Text(sp.kind.KindImg)
                    .font(.system(size: 40, weight: .bold, design: .default))
            }
            .frame(width: 50, height: 50, alignment: .center)
            
            VStack(alignment: .leading) {
                Text(sp.title)
                    .font(.headline)
                Text(date2string(Datestr: sp.time))
                    .font(.caption)
            }
            
            Spacer()
        }
        .foregroundColor(sp.theme.accentColor)
    }
}

struct SpecialDayRow_Previews: PreviewProvider {
    static var sp = SpecialDays.sampleData[0]
    static var previews: some View {
        SpecialDayRow(sp: SpecialDays.sampleData[0])
            .background(sp.theme.mainColor)
            .previewLayout(.sizeThatFits)
    }
}
