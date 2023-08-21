//
//  AssumptionScreen.swift
//  pawpal
//
//  Created by Aqilla Julia Chandra on 04/06/23.
//

import SwiftUI
import CoreData

struct AssumptionView: View {
    
    @EnvironmentObject var modelView: ModelView
    @Environment(\.managedObjectContext) private var context
    @StateObject var assumptionViewModel = AssumptionViewModel()
    
    var body: some View {
        
        VStack (alignment: .leading) {
            Spacer().frame(height:14)
            
            Image ("cat-assumption")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(maxWidth: 390, idealHeight: 240, maxHeight: 240, alignment: .center)
                .padding(.bottom, 47)
            
            Text ("Apa yang sedang dilakukan kucing kamu?")
                .font(.callout)
                .fontWeight(.bold)
                .fontDesign(.rounded)
            
            TextField("Contoh: Menyendiri", text: $assumptionViewModel.text)
                .padding(.horizontal, 20)
                .frame(width: 345, height: 56)
                .foregroundColor(Color("orange600"))
                .background(
                    RoundedRectangle(cornerRadius: 20)
                        .stroke(Color("orange600"), lineWidth: 1.5)
                        .background(Color.white)
                )
                .padding(.bottom, 40)
            
            Text ("Kucing kamu terlihat sedang membutuhkan:")
                .font(.callout)
                .fontWeight(.bold)
                .fontDesign(.rounded)
            
            HStack {
                createButton(buttonName: "Makan")
                createButton(buttonName: "Minum")
                createButton(buttonName: "Birahi")
            }
            
            HStack {
                createButton(buttonName: "Main")
                createButton(buttonName: "Istirahat")
                createButton(buttonName: "Lainnya")
            }
            .padding(.bottom, 40)
            
            ActionButton(action: {
                assumptionViewModel.saveToLog(
                    modelView : modelView,
                    log : PawLog(context: context),
                    callBack: {
                        do{
                            try context.save()
                            print("Data berhasil disimpan di Core Data.")
                        } catch {
                            print("Gagal menyimpan data di Core Data: \(error)")
                        }
                        
                    }
                )
            },
                         label: "Analisa", textColor: "neutral10", buttonColor: "green800")
            .sheet(isPresented: $assumptionViewModel.wantSave) {
                AnalysisResultScreen()
            }
        }
        .padding(.horizontal, 24)
        .onAppear(){
            modelView.predict()
        }
        
    }
    
    @ViewBuilder
    func createButton(buttonName: String) -> some View {
        Button {
            assumptionViewModel.selectedButton = buttonName
        } label: {
            Text(buttonName)
                .fontWeight(.medium)
                .frame(width: 108, height: 56)
                .foregroundColor(assumptionViewModel.selectedButton == buttonName ? .white : Color("orange600"))
                .background(
                    RoundedRectangle(cornerRadius: 20)
                        .stroke(Color("orange600"), lineWidth: 3)
                        .background(assumptionViewModel.selectedButton == buttonName ? Color("orange600") : .white)
                )
                .cornerRadius(20)
        }
    }
    
}

struct SaveLog: View {
    
    var body: some View {
        AssumptionView()
            .environment(\.managedObjectContext, PersistenceController.shared.container.viewContext)
        
    }
}
