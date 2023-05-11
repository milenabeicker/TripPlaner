//
//  PlaceRowRoteiro.swift
//  TripPlanner
//
//  Created by Yasmin araujo on 10/05/2023.
//

import SwiftUI

struct PlaceRowRoteiro: View {
    @EnvironmentObject var roteiroManager: RoteiroManager
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
                        roteiroManager.removeFromRoteiro(place: place)
                    } label: {
                        Image(systemName: "trash")
                            .foregroundColor(.black)
                        
                    }
                }
                .padding()
        
            }
        }
    }
}

struct PlaceRowRoteiro_Previews: PreviewProvider {
    static var previews: some View {
        PlaceRowRoteiro(place: placesNY[2])
            .environmentObject(RoteiroManager())
    }
}
