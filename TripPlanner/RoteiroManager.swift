//
//  RoteiroManager.swift
//  TripPlanner
//
//  Created by Yasmin araujo on 10/05/2023.
//

import Foundation
import SwiftUI

class RoteiroManager: ObservableObject {
    @Published var places: [Place] = []
    @Published var total: Double = 0
    
//    @Published private(set) var places: [Place] = []
//    @Published private(set) var total: Double = 0
//
    func addToRoteiro(place: Place) {
        
        places.append(place)
        total += place.price
        print("\(places)")
        
    }
    
    func removeFromRoteiro(place: Place) {
        
        places = places.filter { $0.id != place.id }
        total -= place.price
    }
    
}
