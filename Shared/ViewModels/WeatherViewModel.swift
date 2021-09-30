//
//  WeatherViewModel.swift
//  Weather
//
//  Created by Russell Gordon on 2021-09-30.
//

import Foundation
import SwiftUI

class WeatherViewModel: ObservableObject {
    
    // History of advice sessions
    @Published var predictions: [Prediction] = []    // empty array to start
    
    // Given a question, provide some advice
    // Library shortcut: Command-Shift-L
    func provideWeatherPrediction() -> Prediction  {
        
        // Use the static function right from the Magic8Ball type (no instance required!)
        var currentPrediction = WeatherPredictionGenerator.getPrediction()

        // Save the question and the advice given to the history
        predictions.append(currentPrediction)
        
        // Give the response back
        return currentPrediction
        
    }
}
