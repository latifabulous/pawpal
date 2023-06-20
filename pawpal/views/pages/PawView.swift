//
//  PawView.swift
//  pawpal
//
//  Created by Nur Izza Latifah on 11/06/23.
//

import SwiftUI

import CoreData

struct PawView: View {
    @AppStorage("username") var username = ""
    @AppStorage("selectedAge") var selectedAge = ""
    
    var body: some View {

        NavigationStack {
            ZStack {
                    Image("paw-bg")
                        .resizable()
                        .scaledToFill()
                        .edgesIgnoringSafeArea(.all)
                    
                    ScrollView(.vertical, showsIndicators: false) {
                        VStack (spacing: 32) {
                            HeaderView()
                                .padding(.top, 40)
                            // add entry
                            ObservasiCardView()
                            
                            
                            // pawlog
                            PawLogCardView()

                            // highlight
                            HighlightCardView()
                            
                            // kebutuhan
                            KebutuhanCardView()
                            }
                        .padding(.bottom, 88)
                        
                    }
                
                    
                    
                    
                
            }
            
    
        }
        
//        .padding(.top, getSafeArea().top)
        
        
        


    }


    

    
}

struct PawView_Previews: PreviewProvider {
    static var previews: some View {
        PawView().environment(\.managedObjectContext, PersistenceController.shared.container.viewContext)
    }
}
