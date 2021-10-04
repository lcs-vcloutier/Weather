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
            
            // Check if history of predictions is empty - in case onAppear fails
            if advisor.predictions.isEmpty == false {
                // Show forecast to user
                GroupBox(
                    label: Label("\(String(format: "%.1f", arguments: [temperature])) °C", systemImage: "\(condition.imageName)")
                        .foregroundColor(.blue)
                ) {
                    Text("Current conditions are \(condition.description.lowercased()). That's \(feel.lowercased())")
                        .font(.title)
                }
                .padding()
            }
            
            
            // Allow user to request new forecast
            
            Button(action: {
                
                // Get a new prediction from the view model
                let prediction = advisor.provideWeatherPrediction()
                
                // Populate state variables so the user interface updates
                temperature = prediction.temperature
                feel = "That's \(prediction.feel.lowercased())."
                condition = prediction.condition
                
            }, label: {
                Text("New Forecast")
                    .padding()
                    .foregroundColor(.blue)
                    .font(.title)
                    .background(.regularMaterial)
                    .cornerRadius(10)
            })
                .padding()
            Spacer()
        }
        .navigationTitle("Weather")
    }
}

