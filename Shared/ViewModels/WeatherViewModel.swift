//
//  WeatherViewModel.swift
//  Weather
//
//  Created by Russell Gordon on 2021-09-30.
//

import Foundation
import SwiftUI

class WeatherViewModel: ObservableObject {
    
    // Creating an empty array to store history of weather predictions
    @Published var predictions: [Prediction] = []
    
    
    init() {
        // Generate several predictions right away
        for _ in 1...3 {
            // Invoke provide prediction method  (part of this class)
            // To generate and save a prediction
            _ = self.provideWeatherPrediction()
        }
    }

    
    // Get a prediction and save that prediction
    func provideWeatherPrediction() -> Prediction  {
        
        // Create the prediction using WeatherPredictionGenerator's static func
        let currentPrediction = WeatherPredictionGenerator.getPrediction()

        // Save the prediction to the history
        predictions.append(currentPrediction)
        
        // Give the response back
        return currentPrediction
        
    }
}
