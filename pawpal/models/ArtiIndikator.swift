//
//  ArtiIndikator.swift
//  pawpal
//
//  Created by ni nyoman putri shopia yuandari on 10/06/23.
//

import SwiftUI
import CoreML

enum KondisiPupil: CustomStringConvertible {
    case besar
    case normal
    case kecil
    
    init(selectedPupil: String) {
        switch selectedPupil {
        case "Besar":
            self = .besar
        case "Normal":
            self = .normal
        case "Kecil":
            self = .kecil
        default:
            self = .kecil
        }
    }
    
    var description: String {
        switch self {
        case .besar:
            return "1Pupil yang terpilih adalah besar yang bulat"
        case .normal:
            return "2Pupil yang terpilih menandakan kasih sayang"
        case .kecil:
            return "3Pupil ini menandakan kesakitan"
        }
    }
}

enum KondisiEkor: CustomStringConvertible {
    case bergetar
    case menggoyang
    case mengibas
    case mengibasTenang
    case terangkat
    
    init(selectedEkor: String) {
        switch selectedEkor {
        case "Bergetar dengan cepat":
            self = .bergetar
        case "Menggoyangkan dengan cepat":
            self = .menggoyang
        case "Mengibas-ibaskan":
            self = .mengibas
        case "Mengibaskan dengan tenang":
            self = .mengibasTenang
        case "Terangkat tinggi dan gemetar":
            self = .terangkat
        default:
            self = .terangkat
        }
    }
    
    var description: String {
        switch self {
        case .bergetar:
            return "1Ekor yang terpilih adalah panjang"
        case .menggoyang:
            return "2Ekor yang terpilih adalah pendek"
        case .mengibas:
            return "3Ekor ada ekor yang terpilih"
        case .mengibasTenang:
            return "4Ekor yang terpilih adalah panjang"
        case .terangkat:
            return "5Ekor yang terpilih adalah pendek"
        }
    }
}

enum KondisiSuara: CustomStringConvertible {
    case mendesis
    case menggeram
    case mengeong
    case tidakBersuara
    
    init(selectedSuara: String) {
        switch selectedSuara {
        case "Mendesis":
            self = .mendesis
        case "Mengeong":
            self = .mengeong
        case "Menggeram":
            self = .menggeram
        case "Tidak bersuara":
            self = .tidakBersuara
        default:
            self = .tidakBersuara
        }
    }
    
    var description: String {
        switch self {
        case .mendesis:
            return "1Suara yang terpilih adalah besar yang bulat"
        case .mengeong:
            return "2Suara yang terpilih menandakan kasih sayang"
        case .menggeram:
            return "3Suara ini menandakan kesakitan"
        case .tidakBersuara:
            return "4Suara ini menandakan kesakitan"
        }
    }
}

enum KondisiBentukBadan: CustomStringConvertible {
    case melengkungBawah
    case menukikAtas
    case baringMelingkar
    case baringSamping
    case baringTerlentang
    case berdiri
    case berjongkok
    case duduk
    
    init(selectedBentukBadan: String) {
        switch selectedBentukBadan {
        case "Badan melengkung ke bawah":
            self = .melengkungBawah
        case "Badan menukik ke atas":
            self = .menukikAtas
        case "Berbaring melingkar":
            self = .baringMelingkar
        case "Berbaring menyamping":
            self = .baringSamping
        case "Berbaring terlentang":
            self = .baringTerlentang
        case "Berdiri tegak":
            self = .berdiri
        case "Berjongkok":
            self = .berjongkok
        case "Duduk tegak":
            self = .duduk
        default:
            self = .duduk
        }
    }
    
    var description: String {
        switch self {
        case .melengkungBawah:
            return "1Badan yang terpilih adalah besar yang bulat"
        case .menukikAtas:
            return "2Badan yang terpilih menandakan kasih sayang"
        case .baringMelingkar:
            return "3Badan ini menandakan kesakitan"
        case .baringSamping:
            return "4Badan yang terpilih adalah besar yang bulat"
        case .baringTerlentang:
            return "5Badan yang terpilih menandakan kasih sayang"
        case .berdiri:
            return "6Badan ini menandakan kesakitan"
        case .berjongkok:
            return "7Badan yang terpilih adalah besar yang bulat"
        case .duduk:
            return "8Badan yang terpilih menandakan kasih sayang"
        }
    }
}

enum KondisiTelinga: CustomStringConvertible {
    case menutupDepan
    case miringSamping
    case tegak
    case tertarikBelakang
    
    init(selectedTelinga: String) {
        switch selectedTelinga {
        case "Menutup ke depan":
            self = .menutupDepan
        case "Miring ke samping":
            self = .miringSamping
        case "Tegak":
            self = .tegak
        case "Tertarik ke belakang":
            self = .tertarikBelakang
        default:
            self = .tertarikBelakang
        }
    }
    
    var description: String {
        switch self {
        case .menutupDepan:
            return "1Telinga yang terpilih adalah besar yang bulat"
        case .miringSamping:
            return "2Telinga yang terpilih menandakan kasih sayang"
        case .tegak:
            return "3Telinga ini menandakan kesakitan"
        case .tertarikBelakang:
            return "4Telinga ini menandakan kesakitan"
        }
    }
}


