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
    
    @State var currentPrediction = Prediction(temperature: 0.0, feel: "", condition:  WeatherCondition(description: "Sunny/Clear", imageName: "sun.max.fill"))
    
    var body: some View {
        VStack (alignment: .leading) {
            GroupBox(
                label: Label("\(String(format: "%.1f", arguments: [currentPrediction.temperature])) °C", systemImage: "\(currentPrediction.condition.imageName)")
                    .foregroundColor(.blue)
            ) {
                Text("Current conditions are \(currentPrediction.condition.description.lowercased()). That's \(currentPrediction.feel.lowercased())!")
                    .font(.title)
            }
            .padding()
            
            
            
            Button(action: {
                //Debug
                print("Button was pressed")
                // Call function from WeatherViewModel to get new prediction
                currentPrediction = advisor.provideWeatherPrediction()
                
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
        .onAppear {
            currentPrediction = advisor.provideWeatherPrediction()
        }
    }
}

