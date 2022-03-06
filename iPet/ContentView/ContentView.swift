//
//  ContentView.swift
//  iPet
//
//  Created by Federico on 06/03/2022.
//

import SwiftUI

extension View {
    func centerH() -> some View {
        HStack {
            Spacer()
            self
            Spacer()
        }
        
    }
}

struct ContentView: View {
    @StateObject private var vm = ViewModel()
    
    var body: some View {
        Form {
            Section("Pet name") {
                TextField("Name your pet!", text: $vm.pet.name)
                Image(vm.pet.happinessLevel == "Happy" ? "happy-pet" : "sad-pet")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 200, height: 200)
                    .padding()
                    .centerH()
                    
            }
            Section("Actions") {
                Button("Feed", action: vm.feed)
                Button("Give water", action: vm.giveWater)
            }
            Section("Status") {
                Text("Status: **\(vm.pet.happinessLevel)**")
                Text("Hunger: **\(vm.pet.hunger)**")
                Text("Thirst: **\(vm.pet.thirst)**")
            }
        }
        .onReceive(vm.timer) {_ in
            vm.saveData()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
