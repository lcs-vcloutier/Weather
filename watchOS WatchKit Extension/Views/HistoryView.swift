//
//  HistoryView.swift
//  watchOS WatchKit Extension
//
//  Created by Vincent Cloutier on 2021-10-02.
//

import SwiftUI

import SwiftUI

struct HistoryView: View {
    // Look at source of truth in iOSApp.swift
    @ObservedObject var advisor: WeatherViewModel
    var body: some View {
        // Show the list of questions and responses
        List(advisor.predictions.reversed()) { prediction in
            // Show forecasted temperature to user
            Text ("\(String(format: "%.1f", arguments: [prediction.temperature])) °C")
                .font(.title)
        }
        .navigationTitle("History")
        
    }
}
