//
//  WeatherPredictionGenerator.swift
//  Weather
//
//  Created by Russell Gordon on 2021-09-30.
//

import Foundation

struct WeatherPredictionGenerator {
    
    // Create an array of possible temperature ranges
    static private let temperatureRanges: [CelsiusTemperatureRange] = [
        
        CelsiusTemperatureRange(feel: "Record-breaking cold",
                                bounds: -100.0 ... -80.0),
        CelsiusTemperatureRange(feel: "Unbelievably cold",
                                bounds: -80.0 ... -60.0),
        CelsiusTemperatureRange(feel: "Incredibly cold",
                                bounds: -60.0 ... -40.0),
        CelsiusTemperatureRange(feel: "Antarctic-level cold",
                                bounds: -40.0 ... -20.0),
        CelsiusTemperatureRange(feel: "Wear a parka cold",
                                bounds: -20.0 ... -10.0),
        CelsiusTemperatureRange(feel: "Bundle up cold",
                                bounds: -10.0 ... -5.0),
        CelsiusTemperatureRange(feel: "Freezing",
                                bounds: -5.0 ... 0.0),
        CelsiusTemperatureRange(feel: "Cold",
                                bounds: 0.0 ... 5.0),
        CelsiusTemperatureRange(feel: "Chilly",
                                bounds: 5.0 ... 10.0),
        CelsiusTemperatureRange(feel: "Moderately warm",
                                bounds: 10.0 ... 15.0),
        CelsiusTemperatureRange(feel: "Canadian shorts weather",
                                bounds: 15.0 ... 20.0),
        CelsiusTemperatureRange(feel: "Nice",
                                bounds: 20.0 ... 25.0),
        CelsiusTemperatureRange(feel: "Warm",
                                bounds: 25.0 ... 30.0),
        CelsiusTemperatureRange(feel: "Steamy",
                                bounds: 30.0 ... 35.0),
        CelsiusTemperatureRange(feel: "Uncomfortable",
                                bounds: 35.0 ... 40.0),
        CelsiusTemperatureRange(feel: "Record-breaking heat",
                                bounds: 40.0 ... 55.0),
        
    ]
    
    // Create an array of possible cold weather conditions (when temp is below 0)
    static private let coldWeatherConditions: [WeatherCondition] = [
        WeatherCondition(description: "Snowy", imageName: "cloud.snow.fill"),
        WeatherCondition(description: "Sunny", imageName: "sun.max.fill"),
        WeatherCondition(description: "Partially cloudy", imageName: "cloud.sun.fill"),
        WeatherCondition(description: "Cloudy", imageName: "cloud.fill"),
    ]
    
    // Create an array of possible warm weather conditions (when temp is above 0)
    static private let warmWeatherConditions: [WeatherCondition] = [
        WeatherCondition(description: "Foggy", imageName: "cloud.fog.fill"),
        WeatherCondition(description: "Drizzling", imageName: "cloud.drizzle.fill"),
        WeatherCondition(description: "Rainy", imageName: "cloud.rain.fill"),
        WeatherCondition(description: "Stormy", imageName: "cloud.heavyrain.fill"),
        WeatherCondition(description: "Hurricanes", imageName: "hurricane"),
        WeatherCondition(description: "Tornadoes", imageName: "tornado"),
        WeatherCondition(description: "Sandstorms", imageName: "sun.dust.fill"),
        WeatherCondition(description: "Sunny", imageName: "sun.max.fill"),
        WeatherCondition(description: "Partially cloudy", imageName: "cloud.sun.fill"),
        WeatherCondition(description: "Cloudy", imageName: "cloud.fill"),
    ]
    
    
    // Provides a random weather prediction
    static func getPrediction() -> Prediction {
        
        // Get a possible temperature range
        let temperatureRange = temperatureRanges.randomElement()!
        
        // Get feel from temp range
        let feel = temperatureRange.feel
        
        // Now get an exact temperature from that range
        let temperature = Double.random(in: temperatureRange.bounds)

        // Initialize condition variable
        var condition = warmWeatherConditions.randomElement()!

        // If temp is below 0.0 use cold weather conditions, if above use warm weather conditions
        if temperature < 0.0 {
            condition = coldWeatherConditions.randomElement()!
        }
        else {
            condition = warmWeatherConditions.randomElement()!
        }
        
        // Make the prediction
        let prediction = Prediction(temperature: temperature,
                                    feel: feel,
                                    condition: condition)
        
        // Return the weather prediction
        return prediction
                
    }
    
}
