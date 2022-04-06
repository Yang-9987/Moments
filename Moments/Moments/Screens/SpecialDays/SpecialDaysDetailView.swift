//
//  SpecialDaysDetail.swift
//  Moments
//
//  Created by 杨健琦 on 4/3/22.
//

import SwiftUI
import SwiftDate

struct SpecialDaysDetailView: View {
    @Binding var sp: SpecialDays
    @State private var data = SpecialDays.Data()
    
    @State private var today: Date = Date()
    @State private var isPresentingEditView: Bool = false
    @State var diffsecond: Int = 0
    
    var body: some View {
        let theday = sp.time
        let diff0 = theday.difference(in: .day, from: today)
        
        ZStack{
            //MARK: BackGround
            LinearGradient(gradient:Gradient(colors: [.blue, .white, .pink]), startPoint: .topLeading, endPoint: .bottomTrailing)
                .edgesIgnoringSafeArea(.all)
            
            //MARK: Num
            VStack {
                Text(sp.title)
                    .font(.system(size: 25, weight: .bold, design: .serif))
                    .padding(10)
                Text(String(diff0!)+"天")
                    .font(.system(size: 60, weight: .light, design: .serif))
                    .padding(10)
                Text(sp.time, style: .relative)
                    .font(.system(size: 45, weight: .light, design: .serif))
                    .padding(10)
                Text(date2string(Datestr: sp.time))
            }
            
            //MARK: other
        }
        .onAppear {
            diffsecond = sp.time.difference(in: .second, from: today)!
        }
        .toolbar {
            Button("Edit") {
                isPresentingEditView = true
                data = sp.data
            }
        }
        .sheet(isPresented: $isPresentingEditView) {
            NavigationView {
                SpecialDaysDetailEditView(data: $data)
                    .navigationTitle(sp.title)
                    .navigationBarTitleDisplayMode(.inline)
                    .toolbar {
                        ToolbarItem(placement: .cancellationAction) {
                            Button("Cancel") {
                                isPresentingEditView = false
                            }
                        }
                        ToolbarItem(placement: .confirmationAction) {
                            Button("Done") {
                                isPresentingEditView = false
                                sp.update(from: data)
                            }
                        }
                    }
            }
        }
    }
}

struct SpecialDaysDetailView_Previews: PreviewProvider {
    static var previews: some View {
        SpecialDaysDetailView(sp: .constant(SpecialDays.sampleData[0]))
    }
}
