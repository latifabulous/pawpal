//
//  AssumptionViewModel.swift
//  pawpal
//
//  Created by ni nyoman putri shopia yuandari on 21/08/23.
//

import Foundation

class AssumptionViewModel : ObservableObject{
    @Published var selectedButton : String = ""
    @Published var text : String = ""
    @Published var wantSave: Bool = false
    
    func saveToLog(modelView : ModelView, log : PawLog,  callBack : ()->Void) -> Void {
        log.logDate = modelView.logDate
        log.logNote = modelView.logNote
        log.catImage = "cat-placeholder"
        log.catEkor = modelView.selectedEkor
        log.catBadan = modelView.selectedBentukBadan
        log.catPupil = modelView.selectedPupil
        log.catSuara = modelView.selectedSuara
        log.catTelinga = modelView.selectedTelinga
        log.catKebutuhan = modelView.predictionResult
        
        callBack()
        
        self.wantSave = true
    }
}
