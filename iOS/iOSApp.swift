//
//  iOSApp.swift
//  iOS
//
//  Created by Sofia Andrade on 2021-10-01.
//

import SwiftUI

@main
struct iOSApp: App {
    // Make an instance of the view model to store questions and advice
    // Source of truth
    @StateObject private var advisor = WeatherViewModel()
    
    var body: some Scene {
        WindowGroup {
            TabView {
                NavigationView {
                    ContentView(advisor: advisor)
                }
                .tabItem {
                    Image(systemName: "thermometer")
                    Text ("Weather")
                    
                }
                
                NavigationView {
                    HistoryView(advisor: advisor)
                }
                .tabItem {
                    Image(systemName: "clock.fill")
                    Text ("History")
                }
            }
        }
    }
}
