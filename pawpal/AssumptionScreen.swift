//
//  AssumptionScreen.swift
//  pawpal
//
//  Created by Aqilla Julia Chandra on 04/06/23.
//

import SwiftUI

struct AssumptionScreenView: View {
    @State private var text: String = ""
    @State var isMakan = false
    @State var isMinum = false
    @State var isBirahi = false
    @State var isMain = false
    @State var isIstirahat = false
    
    var body: some View {
        VStack {
            HStack {
                Image(systemName: "chevron.left")
                    .fontWeight(.medium)
                    .foregroundColor(Color("Orange600"))
                    .padding(.leading, 23)
                Text ("Kembali")
                    .fontWeight(.medium)
                    .foregroundColor(Color("Orange600"))
                    .padding(.leading, 5)
                Spacer()
            }
            Spacer()
            
            Image ("meng")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(maxWidth: .infinity)
            
            Spacer()
            HStack{
                VStack(alignment:.leading){
                    Text ("Apa yang sedang dilakukan kucing?")
                        .multilineTextAlignment(.leading)
                    
                    TextField ("Contoh: Menyendiri", text: $text)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .frame(width: 345, height: 56)
                }
                Spacer()
            }.padding(.leading, 24)
            
            Spacer()
            VStack{
                HStack{
                    Text ("Kucing terlihat sedang membutuhkan:")
                    Spacer()
                }
                HStack {
                    Button{
                        if !isMakan{
                            isMakan = true
                            isMinum = false
                            isBirahi = false
                            isMain = false
                            isIstirahat = false
                            
                        }
                    }label: {
                        Text("Makan")
                            .fontWeight(.medium)
                            .frame(width: 94, height: 56)
                            .foregroundColor(isMakan ? .white : Color("Green800"))
                            .background(
                                RoundedRectangle(cornerRadius: 20)
                                    .stroke(Color("Green800"), lineWidth: 3)
                                    .background(isMakan ? Color("Green800") : .white)
                            )
                            .cornerRadius(20)
                    }
                    
                    
                    Button{
                        if !isMinum{
                            isMakan = false
                            isMinum = true
                            isBirahi = false
                            isMain = false
                            isIstirahat = false
                            
                        }
                    }label: {
                        Text("Minum")
                            .fontWeight(.medium)
                            .frame(width: 94, height: 56)
                            .foregroundColor(isMinum ? .white : Color("Green800"))
                            .background(
                                RoundedRectangle(cornerRadius: 20)
                                    .stroke(Color("Green800"), lineWidth: 3)
                                    .background(isMinum ? Color("Green800") : .white)
                            )
                            .cornerRadius(20)
                    }
                    
                    Button{
                        if !isBirahi{
                            isMakan = false
                            isMinum = false
                            isBirahi = true
                            isMain = false
                            isIstirahat = false
                            
                        }
                    }label: {
                        Text("Birahi")
                            .fontWeight(.medium)
                            .frame(width: 94, height: 56)
                            .foregroundColor(isBirahi ? .white : Color("Green800"))
                            .background(
                                RoundedRectangle(cornerRadius: 20)
                                    .stroke(Color("Green800"), lineWidth: 3)
                                    .background(isBirahi ? Color("Green800") : .white)
                            )
                            .cornerRadius(20)
                        Spacer()
                    }
                }
                HStack{
                    Button{
                        if !isMakan{
                            isMakan = false
                            isMinum = false
                            isBirahi = false
                            isMain = true
                            isIstirahat = false
                            
                        }
                    }label: {
                        Text("Main")
                            .fontWeight(.medium)
                            .frame(width: 94, height: 56)
                        
                            .foregroundColor(Color("Green800"))
                            .background(
                                RoundedRectangle(cornerRadius: 20)
                                    .stroke(Color("Green800"), lineWidth: 3)
                            )
                            .cornerRadius(20)
                        
                        Text("Istirahat")
                            .fontWeight(.medium)
                            .frame(width: 94, height: 56)
                        
                            .foregroundColor(Color("Green800"))
                            .background(
                                RoundedRectangle(cornerRadius: 20)
                                    .stroke(Color("Green800"), lineWidth: 3)
                            )
                            .cornerRadius(20)
                        
                        Spacer()
                    }
                    Spacer().frame(height: 40)
                    
                    
                    
                }
//                .padding(.leading, 24)
                Text("Cek perilaku")
                    .fontWeight(.semibold)
                    .frame(width: 342, height: 56)
                    .background(RoundedRectangle(cornerRadius: 8)
                        .foregroundColor(Color("Orange600")))
                    .foregroundColor(Color.white)
                Spacer()
                
            }
                    .padding(.horizontal, 24)
            
            
        }
        }
    
}

struct AssumptionScreen_Previews: PreviewProvider {
    static var previews: some View {
        AssumptionScreenView()
    }
}

