//
//  MainView.swift
//  Moments
//
//  Created by Yang Jianqi on 2022/4/1.
//

import SwiftUI

struct MainView: View {
    @StateObject private var momentstore = MomentStore()
    @StateObject private var specialdaysstore = SpecialDayStore()
    
    var body: some View {
        TabView {
            MomentsListView(moments: $momentstore.moments){
                Task {
                    do {
                        try await MomentStore.save(storys: momentstore.moments)
                    } catch {
                        fatalError("Error saving.")
                    }
                }
            }
            .tabItem {
                Image(systemName: "heart.circle")
                Text("Moments")
            }

            SpecialDaysListView(sps: $specialdaysstore.sps) {
                Task {
                    do {
                        try await SpecialDayStore.save(sps: specialdaysstore.sps)
                    } catch {
                        fatalError("Error saving.")
                    }
                }
            }
            .tabItem {
                Image(systemName: "calendar")
                Text("SpecialDays")
            }
            
            FightViews()
            .tabItem {
                Image(systemName: "quote.opening")
                Text("Fights")
            }
            
            SettingsView()
            .tabItem {
                Image(systemName: "gearshape")
                Text("Settings")
            }
        }
        .task {
            do {
                momentstore.moments = try await MomentStore.load()
                specialdaysstore.sps = try await SpecialDayStore.load()
            } catch {
                fatalError("Error loading.")
            }
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
