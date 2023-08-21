//
//  AddNoteLogViewModel.swift
//  pawpal
//
//  Created by ni nyoman putri shopia yuandari on 21/08/23.
//

import Foundation

class AddNoteLogViewModel: ObservableObject {
    @Published var logDate: Date = Date()
    @Published var logNote: String = ""
    @Published var catPupil: String = ""
    @Published var catTelinga: String = ""
    @Published var catSuara: String = ""
    @Published var catEkor: String = ""
    @Published var catBadan: String = ""
    @Published var catKebutuhan: String = ""
    @Published var catImage: String = ""
    
    
    func addNote(logViewModel : LogViewModel, pawLog : PawLog, callback: ()->Void) {
        if let existedPawLog = logViewModel.editLog {
            
            existedPawLog.logNote = self.logNote
        } else {
            pawLog.logNote = self.logNote
            pawLog.logDate = self.logDate
            pawLog.catEkor = self.catEkor
            pawLog.catBadan = self.catBadan
            pawLog.catImage = self.catImage
            pawLog.catPupil = self.catPupil
            pawLog.catSuara = self.catSuara
            pawLog.catTelinga = self.catTelinga
            pawLog.catKebutuhan = self.catKebutuhan
        }
        
        // save
        callback()
    }
}
