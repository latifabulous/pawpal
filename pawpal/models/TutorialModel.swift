//
//  TutorialModel.swift
//  pawpal
//
//  Created by ni nyoman putri shopia yuandari on 18/08/23.
//

import Foundation
import SwiftUI

struct TutorialModel: Identifiable {
    let id: UUID
    var image: String
    var description: String
}

let tutorialLists: [TutorialModel] = [
    TutorialModel(id: UUID(), image: "tutorial-foto", description: "Arahkan kamera ke arah kucingmu"),
    TutorialModel(id: UUID(), image: "tutorial-drag", description: "Masukkan bahasa tubuh yang ditunjukkan koyumi berdasarkan tiap indikator"),
    TutorialModel(id: UUID(), image: "tutorial-log", description: "Dapatkan hasil analisa terkait perilaku")
]
