//
//  InformationPage.swift
//  pawpal
//
//  Created by Aqilla Julia Chandra on 10/06/23.
//

import SwiftUI

struct InformationView: View {
    
    var body: some View {
        VStack (alignment: .leading) {
            TitleText(text: "Indikator Tubuh Kucing")
            
            ScrollView(.vertical, showsIndicators: false) {
                ForEach(indicatorLists) { itm in
                    Title2Text(text: itm.title)
                        .fontWeight(.semibold)
                        .padding(.top, 24)
                        .padding(.bottom, 1)
                    
                    SubHeadlineText(text: itm.description)
                    
                    ForEach(itm.listName){ item in
                        HStack {
                            Image (item.img)
                                .resizable()
                                .frame(width: 111, height: 111)
                                .padding(.vertical, 24)
                                .padding(.trailing, 24)
                            
                            VStack(spacing: 8) {
                                HeadlineText(text: item.label)
                                FootnoteText(text: item.deskripsi)
                            }
                        } .padding(.top, 8)
                    }
                }
            }
        }
        .padding(.horizontal, 24)
    }
}


struct InformationView_Previews: PreviewProvider {
    static var previews: some View {
        InformationView()
    }
}
