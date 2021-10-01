//
//  HistoryView.swift
//  iOS
//
//  Created by Vincent Cloutier on 2021-10-01.
//

import SwiftUI

struct HistoryView: View {
    // Look at source of truth in iOSApp.swift
    @ObservedObject var advisor: WeatherViewModel
    var body: some View {
        // Show the list of questions and responses
        List(advisor.predictions.reversed()) { prediction in
            GroupBox(
                label: Label("\(String(format: "%.1f", arguments: [prediction.temperature])) °C", systemImage: "\(prediction.condition.imageName)")
                    .foregroundColor(.blue)
            ) {
                Text("Current conditions are \(prediction.condition.description.lowercased()). That's \(prediction.feel.lowercased())!")
                    .font(.title)
            }
            .padding()
        }
        .padding()
        .navigationTitle("History")
    }
}
