//
//  PlaceCard.swift
//  TripPlanner
//
//  Created by Yasmin araujo on 10/05/2023.
//

import SwiftUI

struct PlaceCard: View {
    @EnvironmentObject var roteiroManager: RoteiroManager
    @State var selectedPlace = false
    
    var place: Place
    
    var body: some View {
        
        ZStack(alignment: .center) {
            ZStack(alignment: .leading) {
                RoundedRectangle(cornerRadius: 12)
                    .frame(height: 100)
                    .foregroundColor(.white)
                    .shadow(color: Color.gray.opacity(0.3), radius: 20, x: 0, y: 10)
                
                
                HStack(alignment: .center, spacing: 10) {
                    Image(place.imageName)
                        .resizable()
                        .scaledToFill()
                        .frame(width: 70, height: 70)
                        .cornerRadius(4)
                        .padding(.vertical, 4)
                    
                    VStack(alignment: .leading, spacing: 5){
                        
                        Text(place.title)
                            .fontWeight(.semibold)
                        
                        Text(place.price, format: .currency(code: "BRL"))
                            .font(.subheadline)
                            .foregroundColor(.green)
                    }
                    Spacer()
                    
                    Button {
                        roteiroManager.addToRoteiro(place: place)
                           
                        
                    } label: {
                        Image(systemName: "plus.circle.fill")
                            .foregroundColor(.black)
                    
                    }
                    
                }
                .padding()
        
            }
        }
    }
}

struct PlaceCard_Previews: PreviewProvider {
    static var previews: some View {
        PlaceCard(place: placesNY[0])
            .environmentObject(RoteiroManager())
    }
}
