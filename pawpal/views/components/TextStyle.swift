//
//  TextStyle.swift
//  pawpal
//
//  Created by ni nyoman putri shopia yuandari on 17/08/23.
//

import Foundation
import SwiftUI

struct TitleText: View {
    var text: String
    
    var body: some View {
        Text (text)
            .multilineTextAlignment(.leading)
            .font(.title)
            .fontWeight(.semibold)
            .foregroundColor(Color("neutral800"))
            .fontDesign(.rounded)
            .padding(.bottom, 20)
            .padding(.top, 40)
    }
}

struct Title2Text: View {
    var text: String
    
    var body: some View {
        Text(text)
            .font(.title2)
            .fontDesign(.rounded)
            .foregroundColor(Color("neutral800"))
            .frame(maxWidth: .infinity, alignment: .leading)
    }
}

struct HeadlineText: View {
    var text: String
    
    var body: some View {
        Text (text)
            .frame(maxWidth: .infinity, alignment: .leading)
            .font(.headline)
            .fontWeight(.semibold)
            .foregroundColor(Color("neutral700"))
            .fontDesign(.rounded)
    }
}

struct SubHeadlineText: View {
    var text: String
    
    var body: some View {
        Text (text)
            .frame(maxWidth: .infinity, alignment: .leading)
            .font(.subheadline)
            .fontWeight(.regular)
            .foregroundColor(Color("neutral600"))
            .fontDesign(.rounded)
    }
}

struct BodyText: View {
    var text: String
    
    var body: some View {
        Text(text)
            .font(.body)
            .fontWeight(.regular)
            .fontDesign(.rounded)
            .foregroundColor(Color("neutral400"))
            .frame(maxWidth: .infinity, alignment: .leading)
    }
}

struct FootnoteText: View {
    var text: String
    
    var body: some View {
        Text(text)
            .font(.system(size: 14))
            .fontWeight(.regular)
            .fontDesign(.rounded)
            .foregroundColor(Color("neutral600"))
            .frame(maxWidth: .infinity, alignment: .leading)
    }
}
