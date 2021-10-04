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
    
    // Create some dummy data to change below (on appear + button) - not very elegant
    @State var temperature: Double
    
    @State var feel: String
    
    @State var condition: WeatherCondition
    
    
    var body: some View {
        VStack {
            
            // Show forecast to user
            // Use GroupBox for iOS
#if os(iOS)
            GroupBox(
                label: Label("\(String(format: "%.1f", arguments: [temperature])) °C", systemImage: "\(condition.imageName)")
                    .foregroundColor(.blue)
            ) {
                Text("Current conditions are \(condition.description.lowercased()). That's \(feel.lowercased()).")
                    .font(.title)
            }
            .padding()
            // Use text for watchOS
#else
            VStack {
                HStack {
                    Text("\(String(format: "%.1f", arguments: [temperature])) °C")
                    Image(systemName: "\(condition.imageName)")
                    
                }
                Text("That's \(feel.lowercased()).")
            }

#endif
            
            
            // Allow user to request new forecast
            
            Button(action: {
                
                // Get a new prediction from the view model
                let prediction = advisor.provideWeatherPrediction()
                
                // Populate state variables so the user interface updates
                temperature = prediction.temperature
                feel = "\(prediction.feel.lowercased())"
                condition = prediction.condition
                
            }, label: {
                Text("New Forecast")
                    .padding()
                    .foregroundColor(.blue)
#if os(iOS)
                    .font(.title)
                    .background(.regularMaterial)
#endif
                    .cornerRadius(10)
            })
            
                .padding()
            Spacer()
        }
        .navigationTitle("Weather")
    }
}

