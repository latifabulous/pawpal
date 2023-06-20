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
            return "Pupil kucing melebar menunjukkan adanya emosi yang intens yang dapat mengindikasikan kegembiraan, ketakutan atau keterancaman."
        case .normal:
            return "Pupil kucing dalam ukuran normal menunjukkan kondisi yang netral atau rileks, tidak ada rangsangan signifikan yang mempengaruhi kucing."
        case .kecil:
            return "Pupil kucing yang kecil biasanya mengindikasikan perasaan takut, cemas, atau ancaman yang dirasakan oleh kucing."
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
            return "Gerakan ekor yang bergetar dengan cepat menandakan kegembiraan dan antusiasme. Kucing mungkin sedang dalam mood siap berinteraksi."
        case .menggoyang:
            return "Gerakan ekor yang menggoyangkan dengan cepat menunjukkan kegembiraan atau rasa ingin tahu saat merasa senang atau sedang mempelajari sesuatu dengan seksama."
        case .mengibas:
            return "Gerakan ekor yang mengibas-ibaskan secara cepat dan agak liar dapat menandakan ketidakpuasan atau ketegangan. Kucing mungkin sedang merasa frustrasi atau marah."
        case .mengibasTenang:
            return "Gerakan ekor yang mengibas perlahan menunjukkan ketenangan dan kepuasan. Kucing mungkin sedang merasa rileks dan nyaman."
        case .terangkat:
            return "Ekor yang terangkat tinggi dan gemetar adalah tanda peringatan atau agresi. Kucing mungkin merasa terancam, dan siap untuk bertindak."
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
            return "Mendesis menunjukkan perasaan ketidaknyamanan, peringatan, atau ancaman saat kucing merasa terganggu atau ingin menjaga jarak."
        case .mengeong:
            return "Mengeong dapat menandakan berbagai perasaan dan kebutuhan, seperti rasa lapar, ingin perhatian, atau ingin keluar."
        case .menggeram:
            return "Menggeram menandakan perasaan agresif saat kucing merasa terancam atau ingin melindungi wilayahnya."
        case .tidakBersuara:
            return "Kucing dapat tidak suara yang terjadi saat mereka sedang mengamati atau dalam keadaan rileks"
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
            return "Posisi badan melengkung ke bawah menandakan ketidaknyamanan atau kecemasan. Kucing mungkin sedang mencari perlindungan atau menyembunyikan diri."
        case .menukikAtas:
            return "Posisi badan menukik ke atas dapat menunjukkan kegembiraan atau keterancaman. Kucing mungkin sedang dalam suasana hati yang intens."
        case .baringMelingkar:
            return "Posisi berbaring melingkar menandakan rasa nyaman dan kepuasan. Kucing mungkin sedang tidur atau beristirahat dengan baik."
        case .baringSamping:
            return "Posisi berbaring menyamping menunjukkan perasaan nyaman, relaksasi, atau kepercayaan. Kucing mungkin sedang merasa santai."
        case .baringTerlentang:
            return "Posisi berbaring terlentang menunjukkan kepercayaan diri dan rasa nyaman yang tinggi. Kucing merasa aman dalam lingkungan beserta orang di sekitarnya."
        case .berdiri:
            return "Posisi berdiri tegak menunjukkan kewaspadaan atau ketertarikan. Kucing mungkin sedang mengamati dengan seksama atau siap untuk bereaksi terhadap rangsangan."
        case .berjongkok:
            return "Posisi berjongkok menandakan kesiapan untuk bertindak atau perasaan yang intens. Kucing mungkin sedang merasa ketakutan atau mempersiapkan diri untuk melompat."
        case .duduk:
            return "Posisi duduk tegak menunjukkan kepercayaan diri, kenyamanan, atau ketenangan. Kucing sedang dalam kondisi yang rileks."
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
            return "Telinga kucing tertutup ke depan bisa menunjukkan rasa ketakutan, kecemasan, atau kewaspadaan saat menghadapi situasi menegangkan."
        case .miringSamping:
            return "Telinga kucing miring ke samping, sering menunjukkan ketertarikan pada suatu objek atau suara saat sedang mengamati sesuatu."
        case .tegak:
            return "Telinga kucing yang tertarik ke belakang sering menandakan perasaan takut, kecurigaan, atau kesiapan untuk bertahan."
        case .tertarikBelakang:
            return "Telinga kucing yang tegak mengindikasikan perasaan rileks, kepercayaan, atau perhatian yang normal saat kucing dalam kondisi nyaman."
        }
    }
}


enum KondisiKebutuhan: CustomStringConvertible {
    case marah
    case bosan
    case lapar
    case butuhPerhatian
    case sakit
    case takut
    
    init(selectedKebutuhan: String) {
        switch selectedKebutuhan {
        case "Marah":
            self = .marah
        case "Bosan":
            self = .bosan
        case "Lapar":
            self = .lapar
        case "Butuh perhatian":
            self = .butuhPerhatian
        case "Sakit":
            self = .sakit
        case "Takut":
            self = .takut
        default:
            self = .takut
        }
    }
    
    var description: String {
        switch self {
        case .marah:
            return "Kucing kamu terlihat sedikit kesal dan marah. Mungkin lebih baik memberikan mereka sedikit ruang dan menghindari mengganggu mereka."
        case .bosan:
            return "Kucing kamu terlihat sedang bosan. Mengajak mereka bermain atau memberikan mainan interaktif bisa menjadi solusi yang baik."
        case .lapar:
            return "Kucing kamu tampak lapar dan membutuhkan makanan. Pastikan mereka memiliki akses ke makanan yang segar dan sesuai dengan diet mereka."
        case .butuhPerhatian:
            return "Kucing kamu mencoba menarik perhatianmu. Berikan sedikit waktu dan kasih sayang untuk memenuhi kebutuhan sosial mereka."
        case .sakit:
            return "Kucing kamu tampak tidak enak badan atau kurang bertenaga. Mungkin perlu untuk memeriksakan kesehatannya ke dokter hewan."
        case .takut:
            return "Kucing kamu sedang merasa takut atau cemas. Cobalah untuk melihat ke sekitar untuk mencari tau penyebab ketakutan agar mereka merasa aman."
        }
    }
}

enum JudulKebutuhan: CustomStringConvertible {
    case marah
    case bosan
    case lapar
    case butuhPerhatian
    case sakit
    case takut
    
    init(selectedJudulKebutuhan: String) {
        switch selectedJudulKebutuhan {
        case "Marah":
            self = .marah
        case "Bosan":
            self = .bosan
        case "Lapar":
            self = .lapar
        case "Butuh perhatian":
            self = .butuhPerhatian
        case "Sakit":
            self = .sakit
        case "Takut":
            self = .takut
        default:
            self = .takut
        }
    }
    
    var description: String {
        switch self {
        case .marah:
            return "Membutuhkan ruang"
        case .bosan:
            return "Membutuhkan hiburan"
        case .lapar:
            return "Membutuhkan makanan"
        case .butuhPerhatian:
            return "Membutuhkan perhatian"
        case .sakit:
            return "Membutuhkan perawatan"
        case .takut:
            return "Membutuhkan rasa aman"
        }
    }
}
