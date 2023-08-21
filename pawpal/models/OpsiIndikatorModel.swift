//
//  OpsiIndikatorModel.swift
//  pawpal
//
//  Created by ni nyoman putri shopia yuandari on 19/08/23.
//

import Foundation

struct OpsiPerIndikator: Identifiable {
    let id: UUID
    var opsi1: String
    var opsi2: String
    var opsi3: String
    var opsi4: String
    var opsi5: String
    var opsi6: String
    var opsi7: String
    var opsi8: String
    
    var allOptions: [String] {
        return [opsi1, opsi2, opsi3, opsi4, opsi5, opsi6, opsi7, opsi8]
    }
}

let opsiIndikatorLists: [OpsiPerIndikator] = [
    OpsiPerIndikator(id: UUID(), opsi1: "Besar", opsi2: "Kecil", opsi3: "Normal", opsi4: " ", opsi5: " ", opsi6: " ", opsi7: " ", opsi8: " "),
    OpsiPerIndikator(id: UUID(), opsi1: "Bergetar dengan cepat", opsi2: "Menggoyangkan dengan cepat", opsi3: "Mengibas-ibaskan", opsi4: "Mengibaskan dengan tenang", opsi5: "Terangkat tinggi dan gemetar", opsi6: " ", opsi7: " ", opsi8: " "),
    OpsiPerIndikator(id: UUID(), opsi1: "Mendesis", opsi2: "Mengeong", opsi3: "Menggeram", opsi4: "Tidak bersuara", opsi5: " ", opsi6: " ", opsi7: " ", opsi8: " "),
    OpsiPerIndikator(id: UUID(), opsi1: "Badan melengkung ke bawah", opsi2: "Badan menukik ke atas", opsi3: "Berbaring melingkar", opsi4: "Berbaring menyamping", opsi5: "Berbaring terlentang", opsi6: "Berdiri tegak", opsi7: "Berjongkok", opsi8: "Duduk tegak"),
    OpsiPerIndikator(id: UUID(), opsi1: "Menutup ke depan", opsi2: "Miring ke samping", opsi3: "Tegak", opsi4: "Tertarik ke belakang", opsi5: " ", opsi6: " ", opsi7: " ", opsi8: " ")
]

