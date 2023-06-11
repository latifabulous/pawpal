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
                    AnalysisResultScreen()
                    .interactiveDismissDisabled()
            }
        }
    }
}



struct AnalysisResultScreen: View {
    @EnvironmentObject var modelView: ModelView
    
    var body: some View {
        ScrollView {
            VStack {
                
                //title heading, result cat need
                Group {
                    Spacer()
                        .frame(height: 52)
                    Text ("Hasil analisa kami")
                        .font(.system(size: 15, weight: .medium, design: .rounded))
                        .foregroundColor(Color("Neutral400"))
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.bottom, 4)
                    
                    //hasil kebutuhan kucing
                    Text ("\(JudulKebutuhan(selectedJudulKebutuhan: modelView.predictionResult).description)")
                        .font(.system(size: 34, weight: .semibold, design: .rounded))
                        .foregroundColor(Color("Neutral800"))
                        .frame(maxWidth: .infinity, alignment: .leading)
                    
                    //elaborasi kebutuhan
                    Text("\(KondisiKebutuhan(selectedKebutuhan: modelView.predictionResult).description)")
                        .font(.system(size: 17, weight: .regular, design: .rounded))
                        .foregroundColor(Color("Neutral800"))
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.vertical, 12)
                }
                
                Color("Neutral200").frame(height: 4 / UIScreen.main.scale)
                
                //penjelasan indikator pupil yang dipilih
                Group {
                    PenjelasanIndicatorComponent(
                        namaIndikator: modelView.selectedPupil,
                        
                        deskripsiIndikator: KondisiPupil(selectedPupil: modelView.selectedPupil).description)
                }
                
                //penjelasan indikator ekor yang dipilih
                Group {
                    PenjelasanIndicatorComponent(
                        namaIndikator: modelView.selectedEkor,
                        
                        deskripsiIndikator: KondisiEkor(selectedEkor: modelView.selectedEkor).description)
                }
                
                //penjelasan indikator suara yang dipilih
                Group {
                    PenjelasanIndicatorComponent(
                        namaIndikator: modelView.selectedSuara,
                        
                        deskripsiIndikator: KondisiSuara(selectedSuara: modelView.selectedSuara).description)
                }
                
                //penjelasan indikator bentuk badan yang dipilih
                Group {
                    PenjelasanIndicatorComponent(
                        namaIndikator: modelView.selectedBentukBadan,
                        
                        deskripsiIndikator: KondisiBentukBadan(selectedBentukBadan: modelView.selectedBentukBadan).description)
                }
                
                //penjelasan indikator telinga yang dipilih
                Group {
                    PenjelasanIndicatorComponent(
                        namaIndikator: modelView.selectedTelinga,
                        
                        deskripsiIndikator: KondisiTelinga(selectedTelinga: modelView.selectedTelinga).description)
                }
                
                Button(action: {
                    
                }, label: {
                    Text ("Save")
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                })
   
            }
            .padding(.horizontal, 24)
        }
    }
    
}

struct PenjelasanIndicatorComponent: View {
    
    var namaIndikator: String = ""
    var deskripsiIndikator: String = ""
    var distance: CGFloat = 12.0
    var imageIndikator: String = "CatAssumption"
    
    var body: some View {
        HStack {
            Image (imageIndikator)
                .resizable()
                .scaledToFit()
                .frame(maxWidth: 113)
            
            VStack {
                Text (namaIndikator)
                    .font(.system(size: 15, weight: .medium, design: .rounded))
                    .foregroundColor(Color("Neutral800"))
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                Spacer()
                    .frame(height: 12)
                
                Text (deskripsiIndikator)
                    .font(.system(size: 13, weight: .regular, design: .rounded))
                    .foregroundColor(Color("Neutral600"))
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                Spacer()
                    .frame(height: distance)
            }
        }
        .padding(.vertical, 12)
        
    }
}

struct Save: View {
    @EnvironmentObject var modelView: ModelView
    @State var wantSave = false
    
    var body: some View {
        
        FinalView(wantSave: $wantSave)
    }
}


struct AnalysisResultScreen_Previews: PreviewProvider {
    
    static var previews: some View {
        let modelView = ModelView() // Membuat objek ModelView di dalam blok previews
        return AnalysisResultScreen()
            .environmentObject(modelView)
    }
}

struct FinalView_Previews: PreviewProvider {
    @Binding var username: String
    static var previews: some View {
        let modelView = ModelView() // Membuat objek ModelView di dalam blok previews
        return Save()
            .environmentObject(modelView)
    }
}
