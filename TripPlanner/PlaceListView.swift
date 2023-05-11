//
//  PlaceListView.swift
//  TripPlanner
//
//  Created by Yasmin araujo on 10/05/2023.
//

import SwiftUI

struct PlaceListView: View {
    
    @EnvironmentObject var roteiroManager: RoteiroManager
   
    //@StateObject var roteiroManager = RoteiroManager()
    @State var selectedPlace = false
    
    var columns = [GridItem(.adaptive(minimum: 350), spacing: 3)]
    
    
    var body: some View {
        
        NavigationView {
            ScrollView {
                LazyVGrid(columns: columns, spacing: 3) {
                    ForEach(placesNY, id: \.id) { place in
                        PlaceCard(place: place)
                            .environmentObject(roteiroManager)
                        
                    }
                }
                .padding()
            }
            .navigationTitle("Lugares")
            .toolbar {
//                NavigationLink {
//                    Tela3View()
//                        .environmentObject(roteiroManager)
//                        
//                } label: {
//                    RoteiroButton()
//                    
//                }
        
            }
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        PlaceListView()
    }
}
