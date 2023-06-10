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
        // initializing request with NSPredicate
        _request = FetchRequest(entity: T.entity(), sortDescriptors: [], predicate: nil)
        self.content = content
    }
    
    var body: some View {
        Group {
            if request.isEmpty {
                Text("kosong")
            } else {
                ForEach(request, id: \.objectID) { object in
                    self.content(object)
                    
                }
            }
        }
    }
}

