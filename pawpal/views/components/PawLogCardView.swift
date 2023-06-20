//
//  PawLogCardView.swift
//  pawpal
//
//  Created by Nur Izza Latifah on 12/06/23.
//

import SwiftUI
import CoreData

struct PawLogCardView: View {

    
    @Environment(\.managedObjectContext) private var viewContext
    
    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \PawLog.logDate, ascending: true)],
        animation: .default)
    
    private var items: FetchedResults<PawLog>
    
    var body: some View {
        VStack {
            HStack {
                Text("Pawlog")
                    .font(.title2)
                    .fontWeight(.bold)
                    .fontDesign(.rounded)
                    .foregroundColor(Color("neutral800"))
                Spacer()
//                Text("Lihat semua")
//                    .font(.footnote)
//                    .fontWeight(.semibold)
//                    .fontDesign(.rounded)
//                    .foregroundColor(Color("orange600"))
            }
            .padding(.horizontal, 24)
            
            VStack(alignment: .leading, spacing: 16) {
                HStack(alignment: .center) {
                    HStack (alignment: .center) {
                        Circle()
                            .foregroundColor(Color("green800"))
                            .frame(width: 16, height: 16)
                        Text("Entry")
                            .font(.callout)
                            .fontWeight(.bold)
                            .fontDesign(.rounded)
                            .foregroundColor(Color("green800"))
                    }
                
                    Spacer()
                    Button(action: {
                        //
                    }) {
                        NavigationLink(destination: PawCamView()) {
                            Image(systemName: "chevron.right")
                                .foregroundColor(Color("orange600"))
                        }
                        
                    }
                    
                }.padding(.horizontal, 16)
                    .padding(.top, 16)
                
                
                HStack {
                    Text("\(fetchTotalDataCount())")
                        .font(.title)
                        .fontWeight(.semibold)
                        .fontDesign(.rounded)
                        .foregroundColor(Color("neutral800"))
                    
                    Text("log")
                        .font(.callout)
                        .fontWeight(.medium)
                        .fontDesign(.rounded)
                        .foregroundColor(Color("neutral400"))
                }
                .padding(.horizontal, 16)
                .padding(.bottom, 16)
            }
            .background(RoundedRectangle(cornerRadius: 20)
                .foregroundColor(Color("neutral10")))
            .padding(.horizontal, 24)
            .cornerRadius(20)
        }
    }
    
    private func fetchTotalDataCount() -> Int {
        
        let fetchRequest: NSFetchRequest<PawLog> = PawLog.fetchRequest()
//        let fetchRequest: NSFetchRequest<NSFetchRequestResult> = NSFetchRequest(entityName: "PawLog")
            do {
                let count = try viewContext.count(for: fetchRequest)
                return count
            } catch {
                print("Error counting data: \(error.localizedDescription)")
                return 0
            }
        }
}

