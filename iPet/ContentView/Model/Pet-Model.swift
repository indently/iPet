//
//  PetModel.swift
//  iPet
//
//  Created by Federico on 06/03/2022.
//

import Foundation

enum Satisfaction {
    case satiated, ok, hungry
}

struct Pet: Codable {
    var name: String
    var lastMeal: Date
    var lastDrink: Date
    var lastUpdated: Date
    
    var happinessLevel: String {
        hunger == "Hungry" || thirst == "Thirsty" ? "Unhappy" : "Happy"
    }
    
    var hunger: String {
        let timeSince = calcTimeSince(date: lastMeal)
        var string = ""
        
        switch timeSince {
        case 0..<30: string = "Satiated"
        case 30..<60: string = "Getting hungry..."
        case 60...: string = "Hungry"
        default: string = "Idk"
        }
        
        return string
        
    }
    var thirst: String {
        let timeSince = calcTimeSince(date: lastDrink)
        var string = ""
        
        switch timeSince {
        case 0..<25: string = "Satiated"
        case 25..<50: string = "Getting thirsty..."
        case 50...: string = "Thirsty"
        default: string = "Idk"
        }
        
        return string
    }
}
