//
//  LogModel.swift
//  pawpal
//
//  Created by Nur Izza Latifah on 10/06/23.
//

import SwiftUI

let currentTimeInterval = Date().timeIntervalSince1970

struct LogModel: Identifiable {
    var id = UUID().uuidString
    var logDate: Date
    var logNote: String
    var pupil: String
    var telinga: String
    var suara: String
    var ekor: String
    var posisi_badan: String
    var kebutuhan: String
    var deskripsi: String
}
