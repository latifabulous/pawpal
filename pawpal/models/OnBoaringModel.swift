//
//  OnBoaringModel.swift
//  pawpal
//
//  Created by ni nyoman putri shopia yuandari on 19/08/23.
//

import Foundation

struct PageOnBoarding: Identifiable {
    let id: UUID
    var image: String
    var description: String
}

let pageLists: [PageOnBoarding] = [
    PageOnBoarding(id: UUID(), image: "onboarding-1", description: "Mari pahami bahasa tubuh kucing untuk memenuhi kebutuhan mereka dengan lebih baik."),
    PageOnBoarding(id: UUID(), image: "onboarding-2", description: "Memudahkan analisa perilaku kucing dengan 5 indikator bagian tubuh kucing."),
    PageOnBoarding(id: UUID(), image: "onboarding-3", description: "Simpan hasil analisa, dan lihat hasil catatan perilaku kucing kamu setiap harinya.")
]
