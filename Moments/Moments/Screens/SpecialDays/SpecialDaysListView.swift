//
//  SpecialDaysView.swift
//  Moments
//
//  Created by Yang Jianqi on 2022/4/1.
//

import SwiftUI

struct SpecialDaysListView: View {
    @Binding var sps: [SpecialDays]
    @State private var newSpecialDay = SpecialDays.Data()
    
    @State private var isPresentNewSpecialDay: Bool = false
    
    @Environment(\.scenePhase) private var scenePhase
    let saveAction: ()->Void
    
    var body: some View {
        NavigationView {
            List {
                ForEach($sps) { $sp in
                    NavigationLink(destination: SpecialDaysDetailView(sp: $sp)) {
                        SpecialDayRow(sp: sp)
                    }
                    .listRowBackground(sp.theme.mainColor)
                }
            }
            .onChange(of: scenePhase) { phase in
                if phase == .inactive { saveAction() }
            }
            .navigationTitle("SpecialDays")
            .toolbar {
                Button(action: {
                    isPresentNewSpecialDay = true
                }) {
                    Image(systemName: "plus")
                }
            }
            .sheet(isPresented: $isPresentNewSpecialDay) {
                NavigationView {
                    SpecialDaysDetailEditView(data: $newSpecialDay)
                        .toolbar {
                            ToolbarItem(placement: .cancellationAction) {
                                Button("Dismiss") {
                                    isPresentNewSpecialDay = false
                                    newSpecialDay = SpecialDays.Data()
                                }
                            }
                            ToolbarItem(placement: .confirmationAction) {
                                Button("Add") {
                                    let newsp = SpecialDays(data: newSpecialDay)
                                    sps.append(newsp)
                                    isPresentNewSpecialDay = false
                                    newSpecialDay = SpecialDays.Data()
                                }
                            }
                        }
                }
            }
        }
    }
}

struct SpecialDaysListView_Previews: PreviewProvider {
    static var previews: some View {
        SpecialDaysListView(sps: .constant(SpecialDays.sampleData), saveAction: {})
    }
}
