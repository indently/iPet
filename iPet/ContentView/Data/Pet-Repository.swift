//
//  Pet-Repository.swift
//  iPet
//
//  Created by Federico on 06/03/2022.
//

import Foundation

class PetRepository {
    private var PET_KEY = "PEY_KEY"
    private var pet: Pet
    
    // Try to load data, or else create a new pet
    init() {
        if let data = UserDefaults.standard.data(forKey: PET_KEY) {
            if let decoded = try? JSONDecoder().decode(Pet.self, from: data) {
                self.pet = decoded
                print("Note data successfully retrieved!")
                return
            }
        }
        self.pet = Pet(name: "Tommy", lastMeal: Date(), lastDrink: Date(), lastUpdated: Date())
    }
    
    func loadData() -> Pet{
        return self.pet
    }
    
    func saveData(pet: Pet) {
        if let encoded = try? JSONEncoder().encode(pet) {
            UserDefaults.standard.set(encoded, forKey: PET_KEY)
            
            print("Data saved at: \(Date().formatted(date: .omitted, time: .standard))")
        }
    }
}
