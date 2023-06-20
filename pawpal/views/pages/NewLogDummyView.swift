//
//  NewLogDummyView.swift
//  pawpal
//
//  Created by Nur Izza Latifah on 10/06/23.
//

import SwiftUI
import CoreData
import Foundation

struct NewLogDummyView: View {
    @EnvironmentObject var modelView: ModelView
    
    @Environment(\.dismiss) var dismiss
    @Environment(\.managedObjectContext) private var context
 
    @EnvironmentObject var logModel: LogViewModel
    
    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \PawLog.logDate, ascending: true)],
        animation: .default)
    private var items: FetchedResults<PawLog>
    
    
    
    // log value
    @State var logDate: Date = Date()
    @State var logNote: String = ""
    @State var catPupil: String = ""
    @State var catTelinga: String = ""
    @State var catSuara: String = ""
    @State var catEkor: String = ""
    @State var catBadan: String = ""
    @State var catKebutuhan: String = ""
    @State var catImage: String = ""

    
    var body: some View {
        NavigationView {
            VStack(alignment:.leading){
                Image("cat-assumption")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 345, height: 247)
                    .padding(.vertical, 32)
                Text ("Apa yang sedang dilakukan kucing?")
                    .multilineTextAlignment(.leading)
                    .font(.callout)
                    .fontWeight(.bold)
                    .fontDesign(.rounded)
                
                TextField("Contoh: Menyendiri", text: $logNote)
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
                Spacer()

            }
//            HStack{
//
//                Spacer()
//            }.padding(.leading, 24)
            
//            List {
//                Section {
//                    TextField("Note", text: $logNote)
//                } header: {
//                    Text("Log Title")
//                }
//
//                // disable kalo edit data karena gaperlu diedit
//                if logModel.editLog == nil {
//                    Section {
//                        Text("Date: \(formattedLogDate)")
//                    } header: {
//                        Text("Log Date")
//                    }
//                }
//            }
//            .listStyle(.insetGrouped)
//            .navigationTitle("PawLog")
//            .navigationBarTitleDisplayMode(.inline)
//
            // disabling dismiss sheet
            .interactiveDismissDisabled()
            
            // action button
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Add note") {
                        if let log = logModel.editLog {
    
                            log.logNote = logNote
                        } else {
                            let log = PawLog(context: context)
                            log.logNote = logNote
                            log.logDate = logDate
                            log.catEkor = catEkor
                            log.catBadan = catBadan
                            log.catImage = catImage
                            log.catPupil = catPupil
                            log.catSuara = catSuara
                            log.catTelinga = catTelinga
                            log.catKebutuhan = catKebutuhan
                        }
                        
                        // save
                        do {
                            try context.save()
                            fetchCoreData()
                            dismiss()
                        } catch {
//                            print("Failed to save log: \(error)")
                            let nsError = error as NSError
                            fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
                        }
                    }
                    .foregroundColor(Color("orange600"))
                    .disabled(logNote == "")
                }
                
                ToolbarItem(placement: .navigationBarLeading) {
                    Button("Batal") {
                        dismiss()
                    }
                    .foregroundColor(Color("orange600"))
                }
            }
            // load task data if in form edit
            
            .onAppear {
                if let log = logModel.editLog{
                    logNote = log.logNote ?? ""
                }
            }
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
                    print("Gambar: \(log.catImage ?? "")")
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
    
    
    private var formattedLogDate: String {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .medium
        return formatter.string(from: logDate)
    }
}

struct NewLogDummyView_Previews: PreviewProvider {
    static var previews: some View {
        NewLogDummyView()
//            .environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
