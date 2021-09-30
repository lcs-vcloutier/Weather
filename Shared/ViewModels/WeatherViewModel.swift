////
////  WeatherViewModel.swift
////  Weather
////
////  Created by Russell Gordon on 2021-09-30.
////
//
//import Foundation
//
//class WeatherViewModel: ObservableObject {
//
//    // History of advice sessions
//    @Published var sessions: [Prediction] = []    // empty array to start
//
//    // Given a question, provide some advice
//    // Library shortcut: Command-Shift-L
//    func provideResponseFor(givenQuery: String) -> String {
//
//        // Start an advice session
//        var currentSession = Prediction(temperature: <#T##Double#>, feel: <#T##String#>, condition: <#T##WeatherCondition#>)
//
//        // Use the static function right from the Magic8Ball type (no instance required!)
//        currentSession.response = WeatherPredictionGenerator.getPrediction()
//
//        // Save the question and the advice given to the history
//        sessions.append(currentSession)
//
//        // Give the response back
//        return currentSession.response
//
//    }
//
//}
