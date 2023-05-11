//
//  Tela1View.swift
//  TripPlanner
//
//  Created by Yasmin araujo on 10/05/2023.
//

import SwiftUI

struct Tela1View: View {
    @State var showpPlanner = false
    
    
    var body: some View {
        
        
        
        NavigationView {
            ZStack(alignment: Alignment(horizontal: .center, vertical: .top)){
                
                VStack{
                    Image("Image")
                        .resizable()
                        .frame(width: 600, height: 600)
                        .padding(.leading, 90)
                    
                }
                
                VStack{
                    Text("Bem -Vindo")
                        .font(.system(size: 20))
                        .multilineTextAlignment(.center)
                        .padding(.top, 128)
                    Text("Planner Trip")
                        .foregroundColor(.black)
                        .font(.system(size: 29))
                        .fontWeight(.semibold)
                        .multilineTextAlignment(.center)
                    
                   Spacer()
                    
                    
                    NavigationLink(destination: Tela2View()){
                        Text("Começar")
                            .frame(width: 300, height: 44, alignment: .center)
                            .background(.black)
                            .foregroundColor(.white)
                            .font(.system(size: 18, weight: .semibold))
                            .cornerRadius(12)
                            .shadow(color: Color.gray.opacity(1), radius: 20, x: 0, y: 10)
                    }
                    .buttonStyle(PlainButtonStyle())
                    .padding(60)
                    
                }
            }
        }
    }
}


struct Tela1View_Previews: PreviewProvider {
    static var previews: some View {
        Tela1View()
    }
}
