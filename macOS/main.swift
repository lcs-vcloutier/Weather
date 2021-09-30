//
//  main.swift
//  Weather
//
//  Created by Russell Gordon on 2021-09-30.
//

import Foundation


// Make an instance of the view model (to store questions and advice)
var advisor = WeatherViewModel()

// Program name
print("WEATHER APP")
print("============")


// Loop until user chooses to quit
while true {
    // Generate a weather prediction
    let prediction = WeatherPredictionGenerator.getPrediction()
    
    // Show the prediction
    print("Current conditions are \(prediction.condition.description.lowercased()) with a temperature of \(String(format: "%.1f", arguments: [prediction.temperature])) °C.")
    
    print("That's \(prediction.feel.lowercased())!")
    
    
    // Ask whether the user wants to continue or see history of advice
    while true {
        print("")
        print("See history of advice given? (Y/N)")
        let selection = readLine()!
        if selection == "Y" {
            
            // Show history
            print("")
            print("History")
            print("-------")
            //            for session in advisor.sessions {
            //                print(session.question)
            //                print(session.response)
            //                print("")
            //            }
            break
            
        } else if selection == "N" {
            break
        }
    }
    
    // Ask whether the user wants to see more advice
    while true {
        print("More advice? (Y/N)")
        let selection = readLine()!
        if selection == "Y" {
            break
        } else if selection == "N" {
            exit(0)
        }
    }
}
