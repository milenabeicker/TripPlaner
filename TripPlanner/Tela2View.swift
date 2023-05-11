//
//  Tela2View.swift
//  TripPlanner
//
//  Created by Yasmin araujo on 10/05/2023.
//

import SwiftUI

struct Tela2View: View {
    
    @EnvironmentObject var roteiroManager: RoteiroManager

    
    var dateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateStyle = .long
        return formatter
    }
    
    var formaData: DateFormatter {
        let forma = DateFormatter()
        forma.dateStyle = .short
        return forma
        
    }
    
    @Environment(\.presentationMode) var presentationMode
    @State var showList = false
    @State var nomecidade = ""
    
    
    @State var orcamento: Int = 0
    @State var custodia: Int = 0
    
    
    //DatePicker
    @State var dataSelec = Date.now
    
    
    //Motrar View
    @State var shouldPresentSheet = false
    
    var body: some View {
        NavigationView {
            VStack{
                
                ZStack{
                    
                    Color(uiColor: .systemGray6).ignoresSafeArea(.all)
                    ScrollView(.vertical, showsIndicators: false){
                        VStack{
                            
                            VStack {
                                HStack{
                                    
                                    ZStack{
                                        RoundedRectangle(cornerRadius: 16).padding().frame(width: UIScreen.main.bounds.maxX-30, height: 350).foregroundColor(.white)
                                            .overlay {
                                                RoundedRectangle(cornerRadius: 16).stroke(.quaternary, lineWidth: 1).padding().frame(width: UIScreen.main.bounds.maxX-30)
                                            }
                                        DatePicker("Dia 1", selection: $dataSelec, displayedComponents: .date)
                                            .accentColor(.black)
                                            .datePickerStyle(.graphical)
                                            .padding(.horizontal, 40)
                                        
                                        
                                    }
                                    
                                }
                                ZStack{
                                    RoundedRectangle(cornerRadius: 13).frame(width: UIScreen.main.bounds.maxX-80, height: 45).foregroundColor(.white).overlay {
                                        RoundedRectangle(cornerRadius: 13).stroke(.quaternary, lineWidth: 1)
                                    }
                                    
                                    TextField("Cidade", text: $nomecidade).textFieldStyle(.plain).frame(width: UIScreen.main.bounds.maxX-100)
                                    
                                    
                                }.padding(.top, 20)
                                
                                ZStack{
                                    RoundedRectangle(cornerRadius: 13).frame(width: UIScreen.main.bounds.maxX-80, height: 45).foregroundColor(.white).overlay {
                                        RoundedRectangle(cornerRadius: 13).stroke(.quaternary, lineWidth: 1)
                                    }
                                    TextField("Orçamento", value: $orcamento,format: .currency(code: "BRL"))
                                        .textFieldStyle(.plain).frame(width: UIScreen.main.bounds.maxX-100).keyboardType(.decimalPad)
                                    
                                }.padding(.top, 20)
                                ZStack{
                                    RoundedRectangle(cornerRadius: 13).frame(width: UIScreen.main.bounds.maxX-80, height: 45).foregroundColor(.white).overlay {
                                        RoundedRectangle(cornerRadius: 13).stroke(.quaternary, lineWidth: 1)
                                    }
                                    Text(roteiroManager.total, format: .currency(code: "BRL"))
                                        .font(.system(.headline).weight(.bold))
                                        .shadow(color: Color.gray.opacity(1), radius: 20, x: 0, y: 10)
                                       
                                    
                                }.padding(.top, 20)
                     }
                                    NavigationLink(destination: Tela3View(model: Model(dataSelec: dataSelec, nomeCidade: nomecidade, orcamento: orcamento, custoDia: custodia))){
                                        Text("Ir para o planner")
                                            .frame(width: 300, height: 44, alignment: .center)
                                            .background(.black)
                                            .foregroundColor(.white)
                                            .font(.system(size: 18, weight: .semibold))
                                            .cornerRadius(12)
                                            .shadow(color: Color.gray.opacity(1), radius: 20, x: 0, y: 10)
                                        
                                    }
                                    .buttonStyle(PlainButtonStyle())
                                    .padding(28)
                                }
                                
                            }
                        }
//                                            .preferredColorScheme(.light)
                    }
        }
        .navigationBarBackButtonHidden(true)
    }
}

struct Tela2View_Previews: PreviewProvider {
    static var previews: some View {
        Tela2View()
            .environmentObject(RoteiroManager())
    }
}
