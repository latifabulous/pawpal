//
//  NewLogDummyView.swift
//  pawpal
//
//  Created by Nur Izza Latifah on 10/06/23.
//

import SwiftUI
import CoreData
import Foundation

struct AddNoteLogView: View {
    @EnvironmentObject var modelView: ModelView
    
    @Environment(\.dismiss) var dismiss
    @Environment(\.managedObjectContext) private var context
    
    @EnvironmentObject var logViewModel: LogViewModel
    
    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \PawLog.logDate, ascending: true)],
        animation: .default)
    private var items: FetchedResults<PawLog>
    
    @StateObject var addNoteLogViewModel = AddNoteLogViewModel()
    
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
                
                TextField("Contoh: Menyendiri", text: $addNoteLogViewModel.logNote)
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
            .interactiveDismissDisabled()
            
            // action button
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Add note") {
                        addNoteLogViewModel.addNote(logViewModel: logViewModel, pawLog: PawLog(context: context), callback: {
                            do {
                                try context.save()
                                fetchCoreData()
                                dismiss()
                            } catch {
                                let nsError = error as NSError
                                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
                            }
                        })
                    }
                    .foregroundColor(Color("orange600"))
                    .disabled(addNoteLogViewModel.logNote == "")
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
                if let log = logViewModel.editLog{
                    addNoteLogViewModel.logNote = log.logNote ?? ""
                }
            }
        }
    }
    
    
    
    // seharusnya di view model
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
    
    // seharusnya di helper
    private var formattedLogDate: String {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .medium
        return formatter.string(from: addNoteLogViewModel.logDate)
    }
}

struct NewLogDummyView_Previews: PreviewProvider {
    static var previews: some View {
        AddNoteLogView()
            .environmentObject(ModelView())
            .environmentObject(LogViewModel())
    }
}
