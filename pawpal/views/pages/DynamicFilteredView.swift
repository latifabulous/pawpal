//
//  DynamicFilteredView.swift
//  pawpal
//
//  Created by Nur Izza Latifah on 10/06/23.
//

import SwiftUI
import CoreData

struct DynamicFilteredView<Content: View, T>: View where T: NSManagedObject{
    // core data request
    @FetchRequest var request: FetchedResults<T>
    let content: (T) -> Content

    // building custom forEach which will give coredata object to build view
    init(dateToFilter: Date, @ViewBuilder content: @escaping (T) -> Content) {
        
        // predicate to filter current date
        let calendar = Calendar.current
        
        let today = calendar.startOfDay(for: dateToFilter)
        let tommorow = calendar.date(byAdding: .day, value: 1, to: today)!
        
        // filter key
        let filterKey = "logDate"
        
        // fetch log between today and tomorrow 24hr
        let predicate = NSPredicate(format: "\(filterKey) >= %@ AND \(filterKey) < %@", argumentArray: [today, tommorow])
        
        // initializing request with NSPredicate
        _request = FetchRequest(entity: T.entity(), sortDescriptors: [], predicate: predicate)
        self.content = content
    }

    var body: some View {
        Group {
            if request.isEmpty {
                Spacer()
                Image("kosong")
                    .resizable()
                    .frame(width: 240, height: 204)
                Text("Belum ada log")
                    .font(.title3)
                    .fontWeight(.medium)
                    .fontDesign(.rounded)
                    .foregroundColor(Color("neutral600"))
                Spacer()
            } else {
                ForEach(request, id: \.objectID) { object in
                    self.content(object)

                }
            }
        }
    }
}

//struct DynamicFilteredView<Content: View, Log>: View where Log: NSManagedObject {
//
//    // Core Data request
//    @FetchRequest var request: FetchedResults<Log>
//    let content: (Log) -> Content
//
//    // Building custom forEach which will give Core Data object to build view
//
//    init(dateToFilter: Date, @ViewBuilder content: @escaping (Log) -> Content) {
//        // Initializing request with NSPredicate
//        let predicate = NSPredicate(format: "logDate == %@", dateToFilter as NSDate)
//        _request = FetchRequest(entity: Log.entity(), sortDescriptors: [], predicate: predicate)
//        self.content = content
//    }
//
//    var body: some View {
//        Group {
//            if request.isEmpty {
//                Text("kosong")
//            } else {
//                ForEach(request, id: \.objectID) { object in
//                    self.content(object)
//                }
//            }
//        }
//    }
//}


