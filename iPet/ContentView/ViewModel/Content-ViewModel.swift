//
//  Content-ViewModel.swift
//  iPet
//
//  Created by Federico on 06/03/2022.
//

import Foundation
import SwiftUI

extension ContentView {
    class ViewModel: ObservableObject {
        @Published var pet: Pet
        private var repository = PetRepository()
        let timer = Timer.publish(every: 15, on: .main, in: .common).autoconnect()

        init() {
            // Load the initial data
            pet = repository.loadData()
        }
        
        func saveData() {
            repository.saveData(pet: pet)
            pet.lastUpdated = Date()
        }
        
        func feed() {
            pet.lastMeal = Date()
            saveData()
        }
        
        func giveWater() {
            pet.lastDrink = Date()
            saveData()
        }
    }
}
