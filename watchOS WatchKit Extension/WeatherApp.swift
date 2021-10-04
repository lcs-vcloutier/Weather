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
    
    var body: some Scene {
        WindowGroup {
            TabView {
                NavigationView {
                    ContentView(advisor: advisor, temperature: advisor.predictions.last!.temperature, feel: advisor.predictions.last!.feel, condition: advisor.predictions.last!.condition)
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
