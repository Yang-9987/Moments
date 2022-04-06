//
//  MomentsListView.swift
//  Moments
//
//  Created by Yang Jianqi on 2022/4/1.
//

import SwiftUI

struct MomentsListView: View {
    @Binding var moments: [Moment]
    @State private var newMomentData = Moment.Data()
    
    @State private var isGridView: Bool = false
    @State private var isPresentingNewMomentView: Bool = false
    @State private var gridLayout: [GridItem] = [ GridItem(.flexible()) ]
    @State private var gridColumn: Int = 1
    @State private var toolbarIcon: String = "square.grid.2x2"
    @State private var smallFont: Bool = false
    
    @Environment(\.scenePhase) private var scenePhase
    let saveAction: ()->Void
    
    let haptics = UIImpactFeedbackGenerator(style: .medium)
    
    func gridSwitch() {
      gridLayout = Array(repeating: .init(.flexible()), count: gridLayout.count % 3 + 1)
      gridColumn = gridLayout.count
      print("Grid Number: \(gridColumn)")
      print(smallFont)
      
      // TOOLBAR IMAGE
      switch gridColumn {
      case 1:
        toolbarIcon = "square.grid.2x2"
        smallFont = false
      case 2:
        toolbarIcon = "square.grid.3x2"
        smallFont = false
      case 3:
        toolbarIcon = "rectangle.grid.1x2"
        smallFont = true
      default:
        toolbarIcon = "square.grid.2x2"
        smallFont = false
      }
    }
    
    var body: some View {
        NavigationView {
            Group {
                if !isGridView {
                    List {
                        ForEach($moments) { $moment in
                            NavigationLink(destination: MomentDetailView(moment: $moment)) {
                                MomentsRow(moment: moment)
                            }
                        }
                        .onDelete { moment in
                            let index = moment[moment.startIndex]
                            FileOperation.removeFile(sourceUrl: moments[index].imageURL)
                            moments.remove(atOffsets: moment)
                        }
                    }
                } else {
                    ScrollView(.vertical, showsIndicators: false) {
                        LazyVGrid(columns: gridLayout, alignment: .center, spacing: 10) {
                            ForEach($moments) { $moment in
                                NavigationLink(destination: MomentDetailView(moment: $moment)) {
                                    MomentsGrid(moment: moment)
                                        .font(.system(size: smallFont ? 10 : 15))
                                        .animation(.spring(), value: smallFont)
                                }
                            }
                        }
                        .animation(.easeIn, value: gridColumn)
                    }
                }
            }//Group
            .onChange(of: scenePhase) { phase in
                if phase == .inactive { saveAction() }
            }
            .navigationTitle("Moments")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    HStack(spacing: 16) {
                        Button(action: {
                            isPresentingNewMomentView = true
                        }) {
                            Image(systemName: "plus")
                                .font(.title2)
                        }//Button-1
                        .frame(width: 50)
                        
                        Button(action: {
                            isGridView = false
                            haptics.impactOccurred()
                        }) {
                            Image(systemName: "square.fill.text.grid.1x2")
                              .font(.title2)
                              .opacity(isGridView ? 1 : 0.2)
                        }//Button-2
                        .frame(width: 50)
                        
                        Button(action: {
                            isGridView = true
                            haptics.impactOccurred()
                            gridSwitch()
                        }) {
                            Image(systemName: toolbarIcon)
                              .font(.title2)
                              .opacity(isGridView ? 0.2 : 1)
                        }//Button-3
                        .frame(width: 50)
                        
                        Button(action: {
                            
                        }) {
                            Image(systemName: "list.bullet")
                              .font(.title2)
                        }//Button-3
                        .frame(width: 50)
                    }
                }
            }
            .sheet(isPresented: $isPresentingNewMomentView) {
                NavigationView {
                    MomentDetailEditView(data: $newMomentData)
                        .toolbar {
                            ToolbarItem(placement: .cancellationAction){
                                Button("Dismiss") {
                                    isPresentingNewMomentView = false
                                    newMomentData = Moment.Data()
                                }
                            }
                            ToolbarItem(placement: .confirmationAction) {
                                Button("Add") {
                                    let newMoment = Moment(data: newMomentData)
                                    moments.append(newMoment)
                                    isPresentingNewMomentView = false
                                    newMomentData = Moment.Data()
                                }
                            }
                        }
                }
            }
        }//NavigationView
    }
}

struct MomentsListView_Previews: PreviewProvider {
    static var previews: some View {
        MomentsListView(moments: .constant(Moment.sampleData), saveAction: {})
    }
}
