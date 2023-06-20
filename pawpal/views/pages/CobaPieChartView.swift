//
//  CobaPieChartView.swift
//  pawpal
//
//  Created by Nur Izza Latifah on 12/06/23.
//

import SwiftUI
import CoreData

struct CobaPieChartView: View {
    @Environment(\.managedObjectContext) private var viewContext
    
    var body: some View {
        
        // Mengambil data PawLog dari Core Data
        let fetchRequest: NSFetchRequest<PawLog> = PawLog.fetchRequest()
        guard let logs = try? viewContext.fetch(fetchRequest) else {
            return AnyView(Text("Failed to fetch data"))
        }
        
        // Menghitung jumlah catKebutuhan berdasarkan masing-masing kebutuhan
        var catKebutuhanCount: [String: Int] = [:]
        
        for log in logs {
            let kebutuhan = log.catKebutuhan ?? "" // Pastikan kebutuhan tidak nil atau kosong
            
            // Jika kebutuhan sudah ada dalam dictionary, tambahkan 1 ke jumlahnya
            if let count = catKebutuhanCount[kebutuhan] {
                catKebutuhanCount[kebutuhan] = count + 1
            } else {
                // Jika kebutuhan belum ada dalam dictionary, inisialisasi jumlahnya dengan 1
                catKebutuhanCount[kebutuhan] = 1
            }
        }
        
        // Mengambil data dan label dari catKebutuhanCount
        let data = catKebutuhanCount.values.map { Double($0) }
        let labels = catKebutuhanCount.keys.map { $0 }
        
        // Menampilkan PieChartView dengan data dan label yang dihasilkan
        return AnyView(PieChartView(data: data, labels: labels))
    }
}
