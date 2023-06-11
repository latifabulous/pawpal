//
//  Model.swift
//  pawpal
//
//  Created by Aqilla Julia Chandra on 11/06/23.
//

import Foundation
import SwiftUI

struct CatModal: Identifiable{
    let id : UUID
    var img : String
    var label : String
}


let bentukBadanLists: [CatModal] = [
CatModal(id: UUID(), img: "CatAssumption", label: "Berbaring melingkar"),
CatModal(id: UUID(), img: "CatAssumption", label: "Berbaring menyamping"),
CatModal(id: UUID(), img: "CatAssumption", label: "Berbaring terlentang"),
CatModal(id: UUID(), img: "CatAssumption", label: "Berdiri tegak"),
CatModal(id: UUID(), img: "CatAssumption", label: "Berjongkok"),
CatModal(id: UUID(), img: "CatAssumption", label: "Duduk tegak"),
CatModal(id: UUID(), img: "CatAssumption", label: "Melengkung ke bawah"),
CatModal(id: UUID(), img: "CatAssumption", label: "Menukik ke atas")
]

let ekorLists: [CatModal] = [
CatModal(id: UUID(), img: "CatAssumption", label: "Bergetar dengan cepat"),
CatModal(id: UUID(), img: "CatAssumption", label: "Menggoyangkan dengan cepat"),
CatModal(id: UUID(), img: "CatAssumption", label: "Mengibas-ibaskan"),
CatModal(id: UUID(), img: "CatAssumption", label: "Mengibaskan dengan tenang"),
CatModal(id: UUID(), img: "CatAssumption", label: "Terangkat tinggi dan gemetar")
]

let pupilLists: [CatModal] = [
CatModal(id: UUID(), img: "CatAssumption", label: "Besar"),
CatModal(id: UUID(), img: "CatAssumption", label: "Kecil"),
CatModal(id: UUID(), img: "CatAssumption", label: "Normal")
]

let suaraLists: [CatModal] = [
CatModal(id: UUID(), img: "CatAssumption", label: "Mendesis"),
CatModal(id: UUID(), img: "CatAssumption", label: "Menggeram"),
CatModal(id: UUID(), img: "CatAssumption", label: "Mengeong"),
CatModal(id: UUID(), img: "CatAssumption", label: "Tidak bersuara")
]

let telingaLists: [CatModal] = [
CatModal(id: UUID(), img: "CatAssumption", label: "Menutup ke depan"),
CatModal(id: UUID(), img: "CatAssumption", label: "Miring ke samping"),
CatModal(id: UUID(), img: "CatAssumption", label: "Tegak"),
CatModal(id: UUID(), img: "CatAssumption", label: "Tertarik ke belakang")
]
