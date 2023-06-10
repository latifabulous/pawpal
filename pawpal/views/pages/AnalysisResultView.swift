//
//  AnalysisResult.swift
//  pawpal
//
//  Created by ni nyoman putri shopia yuandari on 10/06/23.
//

import SwiftUI
import CoreML

struct FinalView: View {
    @EnvironmentObject var modelView: ModelView
    @Binding var wantSave: Bool

    var body: some View {
        VStack {
            Text("Prediction: \(modelView.predictionResult)")
                .padding()
            
            
            EntryDataView()

            Button(action: {
                modelView.predict()
            }) {
                Text("Predict")
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
            
            Spacer()
            
            Text("kondisi nya \(KondisiSuara(selectedSuara: modelView.selectedSuara).description)") // Memanggil enum KondisiPupil
            
            Button(action: {
                wantSave = true
            }) {
                Text("Save")
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
            .sheet(isPresented: $wantSave) {
                        ResultScreen()
                    }
        }
    }
}



struct ResultScreen: View {
    @EnvironmentObject var modelView: ModelView
   
    var body: some View {
        VStack {
            Text("kondisi nya \(KondisiPupil(selectedPupil: modelView.selectedPupil).description)") // Memanggil enum KondisiPupil

            
        }
    }
}

struct Save: View {
    @EnvironmentObject var modelView: ModelView
    @State var wantSave = false
    
    var body: some View {
        
        FinalView(wantSave: $wantSave)
    }
}


struct FinalView_Previews: PreviewProvider {
    static var previews: some View {
        let modelView = ModelView() // Membuat objek ModelView di dalam blok previews
        return Save()
            .environmentObject(modelView)
    }
}
