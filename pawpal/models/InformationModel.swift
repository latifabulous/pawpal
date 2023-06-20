//
//  Model.swift
//  pawpal
//
//  Created by Aqilla Julia Chandra on 11/06/23.
//

import Foundation
import SwiftUI

struct CatModal: Identifiable{
    let id: UUID
    var img: String
    var label: String
    var deskripsi: String
}

let bentukBadanLists: [CatModal] = [
    CatModal(id: UUID(), img: "cat-placeholder", label: "Berbaring melingkar", deskripsi: "Posisi berbaring melingkar menandakan rasa nyaman dan kepuasan. Kucing mungkin sedang tidur atau beristirahat dengan baik."),
CatModal(id: UUID(), img: "cat-placeholder", label: "Berbaring menyamping", deskripsi: "Posisi berbaring menyamping menunjukkan perasaan nyaman, relaksasi, atau kepercayaan. Kucing mungkin sedang merasa santai dan siap untuk beristirahat."),
CatModal(id: UUID(), img: "cat-placeholder", label: "Berbaring terlentang", deskripsi: "Posisi berbaring terlentang menunjukkan kepercayaan diri dan rasa nyaman yang tinggi. Kucing merasa aman dalam lingkungan mereka dan percaya pada orang di sekitarnya."),
CatModal(id: UUID(), img: "cat-placeholder", label: "Berdiri tegak", deskripsi: "Posisi berdiri tegak menunjukkan kewaspadaan, ketertarikan, atau kesiapan untuk bertindak. Kucing mungkin sedang mengamati dengan seksama atau siap untuk bereaksi terhadap rangsangan."),
CatModal(id: UUID(), img: "cat-placeholder", label: "Berjongkok", deskripsi: "Posisi berjongkok menandakan kesiapan untuk bertindak atau perasaan yang intens. Kucing mungkin sedang merasa ketakutan atau mungkin mempersiapkan diri untuk melompat."),
CatModal(id: UUID(), img: "cat-placeholder", label: "Duduk tegak", deskripsi: "Posisi duduk tegak menunjukkan kepercayaan diri, kenyamanan, atau ketenangan. Kucing sedang dalam kondisi yang nyaman dan rileks."),
CatModal(id: UUID(), img: "cat-placeholder", label: "Melengkung ke bawah", deskripsi: "Posisi badan melengkung ke bawah menandakan ketidaknyamanan, ketakutan, atau kecemasan. Kucing mungkin sedang mencari perlindungan atau ingin menyembunyikan diri."),
CatModal(id: UUID(), img: "cat-placeholder", label: "Menukik ke atas", deskripsi: "Posisi badan menukik ke atas dapat menunjukkan kegembiraan atau keterancaman. Kucing mungkin sedang dalam suasana hati yang intens.")
]

let ekorLists: [CatModal] = [
CatModal(id: UUID(), img: "cat-placeholder", label: "Bergetar dengan cepat", deskripsi: "Gerakan ekor yang bergetar dengan cepat menandakan kegembiraan dan antusiasme. Kucing mungkin sedang dalam mood siap berinteraksi."),
CatModal(id: UUID(), img: "cat-placeholder", label: "Menggoyangkan dengan cepat", deskripsi: "Gerakan ekor yang menggoyangkan dengan cepat menunjukkan kegembiraan, minat, atau rasa ingin tahu. Kucing mungkin sedang merasa senang atau sedang mempelajari sesuatu dengan seksama."),
CatModal(id: UUID(), img: "cat-placeholder", label: "Mengibas-ibaskan", deskripsi: "Gerakan ekor yang mengibas-ibaskan secara cepat dan agak liar dapat menandakan ketidakpuasan atau ketegangan. Kucing mungkin sedang merasa frustrasi atau marah."),
CatModal(id: UUID(), img: "cat-placeholder", label: "Mengibaskan dengan tenang", deskripsi: "Gerakan ekor yang mengibas perlahan menunjukkan ketenangan dan kepuasan. Kucing mungkin sedang merasa rileks dan nyaman."),
CatModal(id: UUID(), img: "cat-placeholder", label: "Terangkat tinggi dan gemetar", deskripsi: "Ekor yang terangkat tinggi dan gemetar adalah tanda peringatan atau agresi. Kucing mungkin merasa marah atau terancam, dan siap untuk bertindak.")
]

let pupilLists: [CatModal] = [
CatModal(id: UUID(), img: "cat-placeholder", label: "Besar", deskripsi: "Pupil kucing melebar menunjukkan adanya emosi yang intens yang dapat mengindikasikan kegembiraan, ketakutan atau keterancaman."),
CatModal(id: UUID(), img: "cat-placeholder", label: "Kecil", deskripsi: "Pupil kucing yang kecil biasanya mengindikasikan perasaan takut, cemas, atau ancaman yang dirasakan oleh kucing."),
CatModal(id: UUID(), img: "cat-placeholder", label: "Normal", deskripsi: "Pupil kucing dalam ukuran normal menunjukkan kondisi yang netral atau rileks, tidak ada rangsangan signifikan yang mempengaruhi kucing.")
]

let suaraLists: [CatModal] = [
CatModal(id: UUID(), img: "cat-placeholder", label: "Mendesis", deskripsi: "Mendesis menunjukkan perasaan ketidaknyamanan, peringatan, atau ancaman saat kucing merasa terganggu atau ingin menjaga jarak."),
CatModal(id: UUID(), img: "cat-placeholder", label: "Menggeram", deskripsi: "Menggeram menandakan perasaan agresif atau marah saat kucing merasa terancam, ingin melindungi wilayah mereka, atau dalam situasi yang mengganggu."),
CatModal(id: UUID(), img: "cat-placeholder", label: "Mengeong", deskripsi: "Mengeong dapat menandakan berbagai perasaan dan kebutuhan, seperti rasa lapar, ingin perhatian, atau ingin keluar."),
CatModal(id: UUID(), img: "cat-placeholder", label: "Tidak bersuara", deskripsi: "Kucing dapat tidak suara yang terjadi saat mereka sedang mengamati, dalam keadaan rileks, atau belum membutuhkan komunikasi vokal untuk saat ini.")
]

let telingaLists: [CatModal] = [
CatModal(id: UUID(), img: "cat-placeholder", label: "Menutup ke depan", deskripsi: "Telinga kucing tertutup ke depan bisa menunjukkan rasa ketakutan, kecemasan, atau kewaspadaan saat kucing menghadapi situasi yang menegangkan."),
CatModal(id: UUID(), img: "cat-placeholder", label: "Miring ke samping", deskripsi: "Telinga kucing miring ke samping, sering menunjukkan ketertarikan pada suatu objek atau suara saat sedang mengamati sesuatu dengan seksama."),
CatModal(id: UUID(), img: "cat-placeholder", label: "Tegak", deskripsi: "Telinga kucing yang tegak mengindikasikan perasaan rileks, kepercayaan, atau perhatian yang normal saat kucing dalam kondisi yang nyaman dan tidak terganggu."),
CatModal(id: UUID(), img: "cat-placeholder", label: "Tertarik ke belakang", deskripsi: "Telinga kucing yang tertarik ke belakang sering menandakan perasaan takut, kecurigaan, atau kesiapan untuk bertahan saat dalam situasi mengkhawatirkan.")
]
