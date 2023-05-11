//
//  Tela3View.swift
//  TripPlanner
//
//  Created by Yasmin araujo on 10/05/2023.
//

import SwiftUI

struct Tela3View: View {
    
  
    @EnvironmentObject var roteiroManager: RoteiroManager
    
    var columns = [GridItem(.adaptive(minimum: 350), spacing: 3)]
    @State var showSheet = false
    
    var model: Model
    var formaData: DateFormatter {
        let forma = DateFormatter()
        forma.dateStyle = .long
        return forma
//        var _: Place
    }
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(alignment: .leading) {
                   
                    HStack {
                        Text("Roteiro")
                            .font(.title)
                            .bold()
                        Spacer()
                    }
                    .padding()
                    
                    HStack (alignment: .center, spacing: 20){
                        Button("Data 1") {
                            print("Button pressed!")
                        }
                        .frame(width: 80, height: 40)
                        .background(Color.black)
                        .foregroundColor(.white)
                        .cornerRadius(12)
                        .shadow(color: Color.gray.opacity(1), radius: 20, x: 0, y: 10)
                    
                        .padding()
                        
                        Button("Data 2") {
                            print("Button pressed!")
                        }
                        .frame(width: 80, height: 40)
                        .background(Color.black)
                        .foregroundColor(.white)
                        .cornerRadius(12)
                        .shadow(color: Color.gray.opacity(1), radius: 20, x: 0, y: 10)
                        .padding()
                        
                        Button("Add +") {
                            print("Button pressed!")
                        }
                        .frame(width: 80, height: 40)
                        .background(Color.black)
                        .foregroundColor(.white)
                        .cornerRadius(12)
                        .shadow(color: Color.gray.opacity(1), radius: 20, x: 0, y: 10)
                        .padding()
                    }
                    .frame(maxWidth:.infinity)
                    
                    ZStack(alignment: .top){
                        RoundedRectangle(cornerRadius: 12)
                            .fill(Color.white)
                            .frame(width: 370, height: 300, alignment: .top)
                            .shadow(color: Color.gray.opacity(0.8), radius: 20, x: 0, y: 10)
                        
                          //  .frame(maxWidth: .infinity)
                            .padding()
                        
                        VStack{
                            HStack{
                                Text("Data")
                                    .font(.system(.headline).weight(.semibold))
                                Spacer()
                                Text("\(model.dataSelec, formatter: formaData )")
                            }
                            .padding(4)
                            HStack{
                                Text("Orçamento")
                                    .font(.system(.headline).weight(.semibold))
                                Spacer()
                               // Text("R")
                                Text(model.orcamento, format: .currency(code: "BRL"))
                                    .foregroundColor(.secondary)
                            }
                            .padding(4)
                            HStack{
                                Text("Destino")
                                    .font(.system(.headline).weight(.semibold))
                                Spacer()
                                Text("\(model.nomeCidade)")
                            }
                            .padding(4)
                            HStack{
                                Text("Transportes disponíveis ")
                                Spacer()
                            }
                            .padding(.top, 16)
                            
                            HStack{
                                Image(systemName:"tram")
                                Text("Metro")
                                    .font(.system(size: 14))
                                Image(systemName:"car.rear")
                                Text("Carro")
                                    .font(.system(size: 14))
                                Image(systemName:"bus.fill")
                                Text("Ônibus")
                                    .font(.system(size: 14))
                                Image(systemName:"bicycle")
                                Text("Bicicleta")
                                    .font(.system(size: 14))
                            }
                            .padding(.top, 4)
                            
                            Divider()
                                .padding()
                            
                            HStack{
                                Text("Total:")
                                    .font(.system(.headline).weight(.bold))
                                Spacer()
                                Text(roteiroManager.total, format: .currency(code: "BRL"))
                                    .font(.system(.headline).weight(.bold))
                               // Text("\(format: .currency(code: "BRL"))
                            }
                            .padding()
                        }
                        .padding(30)
                    }
//                    VStack {
//                        NavigationLink(destination: PlaceListView().environmentObject(roteiroManager)){
//                            Text("Ir para o planner")
//                                .frame(width: 298, height: 58)
//                                .background(.black)
//                                .foregroundColor(.white)
//                                .cornerRadius(12)
//                        }
//                        .buttonStyle(PlainButtonStyle())
//                        .padding(28)
//                    }
                  VStack{
                        Button("Adicionar") {
                            showSheet.toggle()
                        }
    
                        .frame(width: 300, height: 44, alignment: .center)
                        .foregroundColor(.white)
                        .background(Color.black)
                        .cornerRadius(12)
                        .font(.system(.title3).weight(.semibold))
                        .shadow(color: Color.gray.opacity(1), radius: 20, x: 0, y: 10)
                        .padding(.top, 60)
                        Spacer()
                    }
                    .frame(maxWidth: .infinity)
                }
                .sheet(isPresented: $showSheet) {
                    PlaceListView()
    
                    
                }
//                if roteiroManager.places.count > 0 {
//                    Text("\(roteiroManager.places.count)")
//                }else{
//                    Text("0")
//                }
                LazyVGrid(columns: columns, spacing: 3) {
                    
                        ForEach(roteiroManager.places, id: \.id) {
                            place in PlaceRowRoteiro(place: place)
                                .environmentObject(roteiroManager)

                        }
                }
            }
            
        }
       
    }
}

struct Tela3View_Previews: PreviewProvider {
    static var previews: some View {
        Tela3View(model: Model(dataSelec: Date.now, nomeCidade: "Paris", orcamento: 3000, custoDia: 600))
            .environmentObject(RoteiroManager())
    }
}
