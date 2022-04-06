//
//  SpecialDaysDetailEditView.swift
//  Moments
//
//  Created by 杨健琦 on 4/3/22.
//

import SwiftUI

struct SpecialDaysDetailEditView: View {
    @Binding var data: SpecialDays.Data
    
    var body: some View {
        Form {
            Section(header: Text("Specialdays Info")) {
                TextField("Title", text: $data.title)
                HStack {
                    DatePicker("Date:", selection: $data.time, displayedComponents: .date)
                }
                KindPicker(kindselection: $data.kind)
                ColorPicker(colorSelection: $data.theme)
            }
        }
    }
}

struct SpecialDaysDetailEditView_Previews: PreviewProvider {
    static var previews: some View {
        SpecialDaysDetailEditView(data: .constant(SpecialDays.sampleData[0].data))
    }
}
