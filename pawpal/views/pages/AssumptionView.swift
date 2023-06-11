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
    @State var isLainnya = false
//    @State var isModal = false
    
    var body: some View {
        NavigationView{
            VStack {
                Spacer().frame(height:14)
                
                
                Image ("cat-assumption")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(minWidth: 269, idealWidth: 269, maxWidth: 269, minHeight: 240, idealHeight: 240, maxHeight: 240, alignment: .center)
                
                Spacer().frame(height: 47)
                HStack{
                    VStack(alignment:.leading){
                        Text ("Apa yang sedang dilakukan kucing?")
                            .multilineTextAlignment(.leading)
                        
                        TextField("Contoh: Menyendiri", text: $text)
//                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .padding(.horizontal, 20)
                            .frame(width: 345, height: 56)
                            .foregroundColor(Color("Orange600"))
                            .background(
                                RoundedRectangle(cornerRadius: 20)
                                    .stroke(Color("Orange600"), lineWidth: 1.5)
                                    .background(Color.white)
                            )

                    }
                    Spacer()
                }.padding(.leading, 24)
                
                Spacer().frame(height: 40)
                VStack(alignment: .leading){
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
                                isLainnya = false
                                
                            }
                        }label: {
                            Text("Makan")
                                .fontWeight(.medium)
                                .frame(width: 94, height: 56)
                                .foregroundColor(isMakan ? .white : Color("Orange600"))
                                .background(
                                    RoundedRectangle(cornerRadius: 20)
                                        .stroke(Color("Orange600"), lineWidth: 3)
                                        .background(isMakan ? Color("Orange600") : .white)
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
                                isLainnya = false
                                
                            }
                        }label: {
                            Text("Minum")
                                .fontWeight(.medium)
                                .frame(width: 94, height: 56)
                                .foregroundColor(isMinum ? .white : Color("Orange600"))
                                .background(
                                    RoundedRectangle(cornerRadius: 20)
                                        .stroke(Color("Orange600"), lineWidth: 3)
                                        .background(isMinum ? Color("Orange600") : .white)
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
                                isLainnya = false
                                
                            }
                        }label: {
                            Text("Birahi")
                                .fontWeight(.medium)
                                .frame(width: 94, height: 56)
                                .foregroundColor(isBirahi ? .white : Color("Orange600"))
                                .background(
                                    RoundedRectangle(cornerRadius: 20)
                                        .stroke(Color("Orange600"), lineWidth: 3)
                                        .background(isBirahi ? Color("Orange600") : .white)
                                )
                                .cornerRadius(20)
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
                                isLainnya = false
                                
                            }
                        }label: {
                            Text("Main")
                                .fontWeight(.medium)
                                .frame(width: 94, height: 56)
                                .foregroundColor(isMain ? .white : Color("Orange600"))
                                .background(
                                    RoundedRectangle(cornerRadius: 20)
                                        .stroke(Color("Orange600"), lineWidth: 3)
                                        .background(isMain ? Color("Orange600") : .white)
                                )
                                .cornerRadius(20)
                            
                            Button{
                                if !isIstirahat{
                                    isMakan = false
                                    isMinum = false
                                    isBirahi = false
                                    isMain = false
                                    isIstirahat = true
                                    isLainnya = false
                                    
                                }
                            }label: {
                                Text("Istirahat")
                                    .fontWeight(.medium)
                                    .frame(width: 94, height: 56)
                                    .foregroundColor(isIstirahat ? .white : Color("Orange600"))
                                    .background(
                                        RoundedRectangle(cornerRadius: 20)
                                            .stroke(Color("Orange600"), lineWidth: 3)
                                            .background(isIstirahat ? Color("Orange600") : .white)
                                    )
                                    .cornerRadius(20)
                                
                                
                            }
                            
                            Button{
                                if !isLainnya{
                                    isMakan = false
                                    isMinum = false
                                    isBirahi = false
                                    isMain = false
                                    isIstirahat = false
                                    isLainnya = true
                                    
                                }
                            }label: {
                                Text("Lainnya")
                                    .fontWeight(.medium)
                                    .frame(width: 94, height: 56)
                                    .foregroundColor(isLainnya ? .white : Color("Orange600"))
                                    .background(
                                        RoundedRectangle(cornerRadius: 20)
                                            .stroke(Color("Orange600"), lineWidth: 3)
                                            .background(isLainnya ? Color("Orange600") : .white)
                                    )
                                    .cornerRadius(20)
                            }
                        }
                    }
                    
                    Spacer().frame(height: 40)
                    
                    
                    
                }.padding(.horizontal, 24)
                Button{
//                    isModal.toggle()
                }label: {
                    Text("Cek perilaku")
                        .fontWeight(.semibold)
                        .frame(width: 342, height: 56)
                        .background(RoundedRectangle(cornerRadius: 8)
                            .foregroundColor(Color("Green800")))
                        .foregroundColor(Color.white)
                }
                
                
            }
            .toolbar{
                ToolbarItem(placement: .navigationBarLeading) {
                    HStack {
                        Image(systemName: "chevron.left")
                            .fontWeight(.medium)
                            .foregroundColor(Color("Green800"))
                        Text ("Kembali")
                            .fontWeight(.medium)
                            .foregroundColor(Color("Green800"))
                        Spacer()
                    }
                }
            }
//            .sheet(isPresented: $isModal) {
//                InformationPage()
//            }
            
        }
        
        
    }
}

struct AssumptionScreen_Previews: PreviewProvider {
    static var previews: some View {
        AssumptionScreenView()
    }
}

