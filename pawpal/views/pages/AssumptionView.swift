//
//  AssumptionScreen.swift
//  pawpal
//
//  Created by Aqilla Julia Chandra on 04/06/23.
//

import SwiftUI

struct AssumptionScreenView: View {
    @State private var text: String = ""
    @State var isMakan = false
    @State var isMinum = false
    @State var isBirahi = false
    @State var isMain = false
    @State var isIstirahat = false
    @State var isLainnya = false
    
    @EnvironmentObject var modelView: ModelView
    @Binding var wantSave: Bool
    @Environment(\.presentationMode) var presentationMode
    @Environment(\.managedObjectContext) private var context
 
    @EnvironmentObject var logModel: LogViewModel
    
    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \PawLog.logDate, ascending: true)],
        animation: .default)
    private var items: FetchedResults<PawLog>
    
    
    
    var body: some View {

        VStack {
            Spacer().frame(height:14)
            
            
            Image ("cat-assumption")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(minWidth: 269, idealWidth: 269, maxWidth: 269, minHeight: 240, idealHeight: 240, maxHeight: 240, alignment: .center)
            
            Spacer().frame(height: 47)
            HStack{
                VStack(alignment:.leading){
                    Text ("Apa yang sedang dilakukan kucing?")
                        .multilineTextAlignment(.leading)
                        .font(.callout)
                        .fontWeight(.bold)
                        .fontDesign(.rounded)
                    
                    TextField("Contoh: Menyendiri", text: $text)
//                            .textFieldStyle(RoundedBorderTextFieldStyle())
                        .font(.callout)
                        .fontWeight(.semibold)
                        .fontDesign(.rounded)
                    
                        .padding(.horizontal, 20)
                        .frame(width: 345, height: 56)
                        .foregroundColor(Color("orange600"))
                        .background(
                            RoundedRectangle(cornerRadius: 20)
                                .stroke(Color("orange600"), lineWidth: 1.5)
                                .background(Color.white)
                        )

                }
                Spacer()
            }.padding(.leading, 24)
            
            Spacer().frame(height: 40)
            VStack(alignment: .leading){
                HStack{
                    Text ("Kucing terlihat sedang membutuhkan:")
                        .font(.callout)
                        .fontWeight(.bold)
                        .fontDesign(.rounded)
                    
                    Spacer()
                }
                HStack {
                    
                    
                    
                    Button{
                        if !isMinum{
                            isMakan = false
                            isMinum = true
                            isBirahi = false
                            isMain = false
                            isIstirahat = false
                            isLainnya = false
                            
                        }
                    }label: {
                        Text("Perawatan")
                            .font(.callout)
                            .fontWeight(.semibold)
                            .fontDesign(.rounded)
                            .frame(width: 165, height: 56)
                            .foregroundColor(isMinum ? .white : Color("orange600"))
                            .background(
                                RoundedRectangle(cornerRadius: 20)
                                    .stroke(Color("orange600"), lineWidth: 3)
                                    .background(isMinum ? Color("orange600") : .white)
                            )
                            .cornerRadius(20)
                    }
                    
                    Button{
                        if !isBirahi{
                            isMakan = false
                            isMinum = false
                            isBirahi = true
                            isMain = false
                            isIstirahat = false
                            isLainnya = false
                            
                        }
                    }label: {
                        Text("Kasih sayang")
                            .font(.callout)
                            .fontWeight(.semibold)
                            .fontDesign(.rounded)
                            .frame(width: 165, height: 56)
                            .foregroundColor(isBirahi ? .white : Color("orange600"))
                            .background(
                                RoundedRectangle(cornerRadius: 20)
                                    .stroke(Color("orange600"), lineWidth: 3)
                                    .background(isBirahi ? Color("orange600") : .white)
                            )
                            .cornerRadius(20)
                    }
                }
                HStack{
                    Button{
                        if !isMakan{
                            isMakan = true
                            isMinum = false
                            isBirahi = false
                            isMain = false
                            isIstirahat = false
                            isLainnya = false
                            
                        }
                    }label: {
                        Text("Makan & Minum")
                            
                            .font(.callout)
                            .fontWeight(.semibold)
                            .fontDesign(.rounded)
                        
                            .frame(width: 165, height: 56)
                            .foregroundColor(isMakan ? .white : Color("orange600"))
                            .background(
                                RoundedRectangle(cornerRadius: 20)
                                    .stroke(Color("orange600"), lineWidth: 3)
                                    .background(isMakan ? Color("orange600") : .white)
                            )
                            .cornerRadius(20)
                    }
                        Button{
                            if !isLainnya{
                                isMakan = false
                                isMinum = false
                                isBirahi = false
                                isMain = false
                                isIstirahat = false
                                isLainnya = true
                                
                            }
                        }label: {
                            Text("Rasa aman")
                                .font(.callout)
                                .fontWeight(.semibold)
                                .fontDesign(.rounded)
                                .frame(width: 165, height: 56)
                                .foregroundColor(isLainnya ? .white : Color("orange600"))
                                .background(
                                    RoundedRectangle(cornerRadius: 20)
                                        .stroke(Color("orange600"), lineWidth: 3)
                                        .background(isLainnya ? Color("orange600") : .white)
                                )
                                .cornerRadius(20)
                        }
                    }
                HStack{
                    Button{
                        if !isIstirahat{
                            isMakan = false
                            isMinum = false
                            isBirahi = false
                            isMain = false
                            isIstirahat = true
                            isLainnya = false
                            
                        }
                    }label: {
                        Text("Istirahat")
                            .font(.callout)
                            .fontWeight(.semibold)
                            .fontDesign(.rounded)
                            .frame(width: 165, height: 56)
                            .foregroundColor(isIstirahat ? .white : Color("orange600"))
                            .background(
                                RoundedRectangle(cornerRadius: 20)
                                    .stroke(Color("orange600"), lineWidth: 3)
                                    .background(isIstirahat ? Color("orange600") : .white)
                            )
                            .cornerRadius(20)
                        
                        
                    }
                    
                    Button{
                        if !isMakan{
                            isMakan = false
                            isMinum = false
                            isBirahi = false
                            isMain = true
                            isIstirahat = false
                            isLainnya = false
                            
                        }
                    }label: {
                        Text("Bermain")
                            .font(.callout)
                            .fontWeight(.semibold)
                            .fontDesign(.rounded)
                            .frame(width: 165, height: 56)
                            .foregroundColor(isMain ? .white : Color("orange600"))
                            .background(
                                RoundedRectangle(cornerRadius: 20)
                                    .stroke(Color("orange600"), lineWidth: 3)
                                    .background(isMain ? Color("orange600") : .white)
                            )
                            .cornerRadius(20)
                }
                
                Spacer().frame(height: 40)
                
                
                
            }
                }
                .padding(.horizontal, 24)
                .padding(.bottom, 24)
            
            Button(action: {
                let log = PawLog(context: context)
                log.logDate = modelView.logDate
                log.logNote = modelView.logNote
                log.catImage = "cat-placeholder"
                log.catEkor = modelView.selectedEkor
                log.catBadan = modelView.selectedBentukBadan
                log.catPupil = modelView.selectedPupil
                log.catSuara = modelView.selectedSuara
                log.catTelinga = modelView.selectedTelinga
                log.catKebutuhan = modelView.predictionResult
                
                do {
                    // Menyimpan data dalam Core Data
                    try context.save()
                    
                    print("Data berhasil disimpan di Core Data.")
                } catch {
                    print("Gagal menyimpan data di Core Data: \(error)")
                }
                
//                modelView.saveDataToCoreData()
                wantSave = true
            }) {
                Text("Analisa")
                    .foregroundColor(Color("neutral10"))
                    .font(.headline)
                    .fontWeight(.semibold)
                    .frame(width: 342, height: 56)
                    .background(Color("green800"))
                    .cornerRadius(20)
            }
            
            
            .sheet(isPresented: $wantSave) {
                    AnalysisResultScreen()
            }

            
            
        }

            
        .onAppear(){
            modelView.predict()
        }
        
        
    
    }
}

struct SaveLog: View {
    @EnvironmentObject var modelView: ModelView
    @State var wantSave = false
    @ObservedObject var logModel: LogViewModel = LogViewModel()
    
    var body: some View {
        
 
        AssumptionScreenView(wantSave: $wantSave)
            .environment(\.managedObjectContext, PersistenceController.shared.container.viewContext)

    }
}
