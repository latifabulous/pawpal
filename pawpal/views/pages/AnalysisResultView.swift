//
//  AnalysisResult.swift
//  pawpal
//
//  Created by ni nyoman putri shopia yuandari on 10/06/23.
//

import SwiftUI
import CoreML
import CoreData
import Foundation

struct FinalView: View {
    
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var modelView: ModelView
    @Binding var wantSave: Bool
    
    @Environment(\.managedObjectContext) private var context
 
    @EnvironmentObject var logModel: LogViewModel
    
    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \PawLog.logDate, ascending: true)],
        animation: .default)
    private var items: FetchedResults<PawLog>
    
    
    

    var body: some View {
        
        VStack {
//            Text("Prediction: \(modelView.predictionResult)")
//                .padding()
//
            NavigationView{
                EntryIndikatorView()
                
            }.navigationBarItems(
                leading: Button(action: {
                    presentationMode.wrappedValue.dismiss()
                }) {
                    Image(systemName: "chevron.left")
                    Text("Kembali")
                        .font(.headline)
                        .fontWeight(.regular)
                        .fontDesign(.rounded)
                }
            )
           
            .toolbar(.hidden, for: .tabBar) 
            
//            .navigationBarHidden(true)
            
            
//            Text("kondisi nya \(KondisiSuara(selectedSuara: modelView.selectedSuara).description)") // Memanggil enum KondisiPupil
            
//            Button(action: {
//                let log = PawLog(context: context)
//                log.logDate = modelView.logDate
//                log.logNote = modelView.logNote
//                log.catImage = modelView.catImage
//                log.catEkor = modelView.selectedEkor
//                log.catBadan = modelView.selectedBentukBadan
//                log.catPupil = modelView.selectedPupil
//                log.catSuara = modelView.selectedSuara
//                log.catTelinga = modelView.selectedTelinga
//                log.catKebutuhan = modelView.predictionResult
//                
//                do {
//                    // Menyimpan data dalam Core Data
//                    try context.save()
//                    
//                    print("Data berhasil disimpan di Core Data.")
//                } catch {
//                    print("Gagal menyimpan data di Core Data: \(error)")
//                }
//                
////                modelView.saveDataToCoreData()
//                wantSave = true
//            }) {
//                Text("Save")
//                    .padding()
//                    .background(Color.blue)
//                    .foregroundColor(.white)
//                    .cornerRadius(10)
//            }
//            
//            
//            .sheet(isPresented: $wantSave) {
//                    AnalysisResultScreen()
////                    .interactiveDismissDisabled()
//            }
        }
    }
}



struct AnalysisResultScreen: View {
    @EnvironmentObject var modelView: ModelView

    
    @Environment(\.managedObjectContext) private var context
 
    @EnvironmentObject var logModel: LogViewModel
    
    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \PawLog.logDate, ascending: true)],
        animation: .default)
    private var items: FetchedResults<PawLog>
    
    @Environment(\.dismiss) var dismiss
    
    
    var body: some View {
        ScrollView {
            VStack {
//                Button("Fetch CoreData") {
//                            fetchCoreData()
//                        }
                //title heading, result cat need
                //title heading, result cat need
                 Group {
                     Spacer()
                         .frame(height: 40)
                     Text ("Hasil analisa kami")
                         .font(.subheadline)
                         .fontWeight(.medium)
                         .fontDesign(.rounded)
                     
                         .foregroundColor(Color("neutral400"))
                         .frame(maxWidth: .infinity, alignment: .leading)
                         .padding(.bottom, 2)
                     
                     //hasil kebutuhan kucing
                     Text ("\(JudulKebutuhan(selectedJudulKebutuhan: modelView.predictionResult).description)")
                         .font(.title)
                         .fontWeight(.semibold)
                         .fontDesign(.rounded)
                         .foregroundColor(Color("neutral800"))
                         .frame(maxWidth: .infinity, alignment: .leading)
                     
                     //elaborasi kebutuhan
                     Text("\(KondisiKebutuhan(selectedKebutuhan: modelView.predictionResult).description)")
                         .font(.headline)
                         .fontWeight(.regular)
                         .fontDesign(.rounded)
                         .foregroundColor(Color("neutral800"))
                         .frame(maxWidth: .infinity, alignment: .leading)
                         .padding(.top, 16)
                         .padding(.bottom, 24)
                 }
                 
//                 Color("neutral200").frame(height: 4 / UIScreen.main.scale)
                
                Divider()
                    .padding(.bottom, 24)

                
                Image("cat-placeholder")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 345, height: 247)
                    .padding(.bottom, 32)
                
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
                 
//                Button(action: {
//                    
//                }, label: {
//                    Text ("Save")
//                        .padding()
//                        .background(Color.blue)
//                        .foregroundColor(.white)
//                        .cornerRadius(10)
//                })
   
                NavigationLink(destination:
    //                            Save()
    //                                .environmentObject(modelView)
    //                                .environmentObject(logModel)
                               LogView().environmentObject(modelView)
                               //                                .environmentObject(logModel)
                ) {

                    Text("Pergi ke log")
                        .font(.headline)
                        .fontWeight(.semibold)
                        .fontDesign(.rounded)
                        .foregroundColor(Color("neutral10"))
                        .background(Color("orange600")
                        .cornerRadius(20)
//                        .padding(.vertical, 32)
                        .frame(width: 342, height: 56)

                    )

                }
                
            }
            .padding(.horizontal, 24)
            
            // disabling dismiss sheet
            .interactiveDismissDisabled()
        }
    }
    
    private func fetchCoreData() {
            let fetchRequest: NSFetchRequest<PawLog> = PawLog.fetchRequest()
            do {
                let logs = try context.fetch(fetchRequest)
                
                for log in logs {
                    print("Log Note: \(log.logNote ?? "")")
                    print("Log Date: \(log.logDate ?? Date())")
                    print("Ekor: \(log.catEkor ?? "")")
                    print("Badan: \(log.catBadan ?? "")")
//                    print("Image: \(log.catImage != nil ? String(describing: log.catImage!) : "")")
                    print("Image: \(log.catImage ?? "")")
                    print("Pupil: \(log.catPupil ?? "")")
                    print("Suara: \(log.catSuara ?? "")")
                    print("Telinga: \(log.catTelinga ?? "")")
                    print("Kebutuhan: \(log.catKebutuhan ?? "")")
                    
                    // Cetak properti lainnya sesuai kebutuhan
                    print("---")
                }
            } catch {
                print("Failed to fetch logs: \(error)")
            }
        }
    
}

struct PenjelasanIndicatorComponent: View {
    
    var namaIndikator: String = ""
    var deskripsiIndikator: String = ""
    var distance: CGFloat = 12.0
    var imageIndikator: String = "cat-placeholder"
    
    var body: some View {
        
        HStack {
            Image (imageIndikator)
                .resizable()
                .scaledToFit()
                .frame(maxWidth: 113)
            
            VStack {
                Text (namaIndikator)
                    .font(.subheadline)
                    .fontWeight(.medium)
                    .fontDesign(.rounded)
                    .foregroundColor(Color("neutral800"))
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                Spacer()
                    .frame(height: 8)
                
                Text (deskripsiIndikator)
                    .font(.footnote)
                    .fontWeight(.regular)
                    .fontDesign(.rounded)
                    .foregroundColor(Color("neutral600"))
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
    @ObservedObject var logModel: LogViewModel = LogViewModel()
    
    var body: some View {
        
 
        FinalView(wantSave: $wantSave)
            .environment(\.managedObjectContext, PersistenceController.shared.container.viewContext)

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
