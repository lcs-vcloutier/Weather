//
//  WeatherApp.swift
//  watchOS WatchKit Extension
//
//  Created by Vincent Cloutier on 2021-10-02.
//

import SwiftUI

@main
struct WeatherApp: App {
    // Make an instance of the view model to store questions and advice
    // Source of truth
    @StateObject private var advisor = WeatherViewModel()
    
    @SceneBuilder var body: some Scene {
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
        WKNotificationScene(controller: NotificationController.self, category: "myCategory")
    }
}
