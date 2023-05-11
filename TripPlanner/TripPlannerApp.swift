//
//  TripPlannerApp.swift
//  TripPlanner
//
//  Created by Yasmin araujo on 10/05/2023.
//

import SwiftUI

@main
struct TripPlannerApp: App {
    @StateObject var roteiroManager = RoteiroManager()
    var body: some Scene {
        WindowGroup {
            Tela1View()
                .environmentObject(roteiroManager)
        }
    }
}
