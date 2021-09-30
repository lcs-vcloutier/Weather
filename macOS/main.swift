//
//  main.swift
//  Weather
//
//  Created by Russell Gordon on 2021-09-30.
//

import Foundation

// Generate a weather prediction
let prediction = WeatherPredictionGenerator.getPrediction()

// Program name
print("WEATHER APP")
print("============")

// Ask for user's question
print("Ask what's the weather:")
// Get input as a non-optional String
let input = readLine()!


// Show the prediction
print("Current conditions are \(prediction.condition.description.lowercased()) with a temperature of \(String(format: "%.1f", arguments: [prediction.temperature])) °C.")

print("That's \(prediction.feel.lowercased())!")

