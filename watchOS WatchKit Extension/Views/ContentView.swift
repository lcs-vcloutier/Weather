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
    @State var currentPrediction = Prediction(temperature: 0.0, feel: "", condition:  WeatherCondition(description: "Sunny/Clear", imageName: "sun.max.fill"))
    
    var body: some View {
        VStack {
            
            // Check if history of predictions is empty - in case onAppear fails
            if advisor.predictions.isEmpty == false {
                
                // Show forecasted temperature to user
                Text ("\(String(format: "%.1f", arguments: [currentPrediction.temperature])) °C")
                    .font(.title)
                
            }
            
            
            
            // Allow user to request new forecast
            Button(action: {
                
                // Debug
                print("Button was pressed")
                
                // Call function from WeatherViewModel to get new prediction
                currentPrediction = advisor.provideWeatherPrediction()
                
            }, label: {
                Text("New Forecast")
                    .padding()
                    .foregroundColor(.blue)
                    .cornerRadius(10)
            })
                .padding()
            Spacer()
        }
        .navigationTitle("Weather")
        .onAppear {
            // Generate new forecast on appear
            currentPrediction = advisor.provideWeatherPrediction()
        }
    }
}

