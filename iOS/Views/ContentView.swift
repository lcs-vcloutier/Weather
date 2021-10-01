//
//  ContentView.swift
//  iOS
//
//  Created by Sofia Andrade on 2021-10-01.
//

import SwiftUI


struct ContentView: View {
    // Look at source of truth in iOSApp.swift
        @ObservedObject var advisor: WeatherViewModel
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("28 Celsius")
                .font(.title)
            HStack {
            Text("Condition")
                .font(.title2)
            }
            Text("Feel")
                .font(.title2)
        }
        .padding()
    }
}

