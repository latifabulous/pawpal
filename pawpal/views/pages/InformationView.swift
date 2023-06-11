//
//  InformationPage.swift
//  pawpal
//
//  Created by Aqilla Julia Chandra on 10/06/23.
//

import SwiftUI

struct InformationView: View {
    var body: some View {
        
        
            VStack (alignment: .leading){
                Text ("Indikator Tubuh Kucing")
                    .multilineTextAlignment(.leading)
                    .font(.custom("", size: 23))
                    .fontWeight(.bold)
                    .foregroundColor(Color("neutral800"))
                    .fontDesign(.rounded)
                    .padding(.leading,24)
                    .padding(.vertical, 6)
                
                Divider()
                    .frame(width: 342)
                    .background(
                        Rectangle()
                            .frame(height: 1)
                            .foregroundColor(Color("green600"))
                    )
                    .padding(.horizontal, 24)
                
                ScrollView(.vertical) {
                HStack (alignment: .top){
                    Image ("CatAssumption")
                        .resizable()
                        .frame(width: 46, height: 46)
                        .clipShape(Circle())
                        .padding(.vertical, 10)
                        .overlay(Circle()
                            .stroke(Color("Green800"), lineWidth: 6)
                            .opacity(0.6))
                    //                        .shadow(radius: 4)
                    
                    VStack (alignment: .leading){
                        Text ("Bentuk Badan")
                            .multilineTextAlignment(.leading)
                            .font(.custom("", size: 22))
                            .fontWeight(.medium)
                            .foregroundColor(Color("neutral800"))
                            .fontDesign(.rounded)
                            .padding(.top, 18)
                            .padding(.bottom, 1)
                        
                        Text ("Bentuk badan kucing merupakan salah satu indikator yang dapat diobservasi untuk mengetahui kebutuhan kucing.")
                            .multilineTextAlignment(.leading)
                            .font(.custom("", size: 14))
                            .fontWeight(.regular)
                            .foregroundColor(Color("neutral600"))
                            .fontDesign(.rounded)
                        
                        
                        ForEach(bentukBadanLists){ itm in
                            HStack {
                                Image (itm.img)
                                    .resizable()
                                    .frame(width: 40, height: 40)
                                    .clipShape(Circle())
                                //                                .padding()
                                    .overlay(Circle()
                                        .stroke(Color("Green800"), lineWidth: 4)
                                        .opacity(0.6))
                                
                                Text (itm.label)
                                    .multilineTextAlignment(.leading)
                                    .font(.custom("", size: 14))
                                    .fontWeight(.regular)
                                    .foregroundColor(Color("neutral700"))
                                    .fontDesign(.rounded)
                                    .padding(.leading, 8)
                            } .padding(.top, 6)
                        }
                        
                    }
                    .padding(.leading, 12)
                    
                }
                .padding(.top, 2)
                .padding(.horizontal, 24)
                
                HStack (alignment: .top){
                    Image ("CatAssumption")
                        .resizable()
                        .frame(width: 46, height: 46)
                        .clipShape(Circle())
                        .padding(.vertical, 10)
                        .overlay(Circle()
                            .stroke(Color("Green800"), lineWidth: 6)
                            .opacity(0.6))
                    //                        .shadow(radius: 4)
                    
                    VStack (alignment: .leading){
                        Text ("Ekor")
                            .multilineTextAlignment(.leading)
                            .font(.custom("", size: 22))
                            .fontWeight(.medium)
                            .foregroundColor(Color("neutral800"))
                            .fontDesign(.rounded)
                            .padding(.top, 18)
                            .padding(.bottom, 1)
                        
                        Text ("Ekor kucing merupakan salah satu indikator yang dapat diobservasi untuk mengetahui kebutuhan kucing.")
                            .multilineTextAlignment(.leading)
                            .font(.custom("", size: 14))
                            .fontWeight(.regular)
                            .foregroundColor(Color("neutral600"))
                            .fontDesign(.rounded)
                        
                        ForEach(ekorLists){ itm in
                            HStack {
                                Image (itm.img)
                                    .resizable()
                                    .frame(width: 40, height: 40)
                                    .clipShape(Circle())
                                //                                .padding()
                                    .overlay(Circle()
                                        .stroke(Color("Green800"), lineWidth: 4)
                                        .opacity(0.6))
                                
                                Text (itm.label)
                                    .multilineTextAlignment(.leading)
                                    .font(.custom("", size: 14))
                                    .fontWeight(.regular)
                                    .foregroundColor(Color("neutral700"))
                                    .fontDesign(.rounded)
                                    .padding(.leading, 8)
                            } .padding(.top, 6)
                            
                        }
                        
                    }
                    .padding(.leading, 12)
                    
                }
                .padding(.top, 2)
                .padding(.horizontal, 24)
                
                HStack (alignment: .top){
                    Image ("CatAssumption")
                        .resizable()
                        .frame(width: 46, height: 46)
                        .clipShape(Circle())
                        .padding(.vertical, 10)
                        .overlay(Circle()
                            .stroke(Color("Green800"), lineWidth: 6)
                            .opacity(0.6))
                    //                        .shadow(radius: 4)
                    
                    VStack (alignment: .leading){
                        Text ("Pupil")
                            .multilineTextAlignment(.leading)
                            .font(.custom("", size: 22))
                            .fontWeight(.medium)
                            .foregroundColor(Color("neutral800"))
                            .fontDesign(.rounded)
                            .padding(.top, 18)
                            .padding(.bottom, 1)
                        
                        Text ("Pupil kucing merupakan salah satu indikator yang dapat diobservasi untuk mengetahui kebutuhan kucing.")
                            .multilineTextAlignment(.leading)
                            .font(.custom("", size: 14))
                            .fontWeight(.regular)
                            .foregroundColor(Color("neutral600"))
                            .fontDesign(.rounded)
                        
                        ForEach(pupilLists){ itm in
                            HStack {
                                Image (itm.img)
                                    .resizable()
                                    .frame(width: 40, height: 40)
                                    .clipShape(Circle())
                                //                                .padding()
                                    .overlay(Circle()
                                        .stroke(Color("Green800"), lineWidth: 4)
                                        .opacity(0.6))
                                
                                Text (itm.label)
                                    .multilineTextAlignment(.leading)
                                    .font(.custom("", size: 14))
                                    .fontWeight(.regular)
                                    .foregroundColor(Color("neutral700"))
                                    .fontDesign(.rounded)
                                    .padding(.leading, 8)
                            } .padding(.top, 6)
                        }
                        
                    }
                    .padding(.leading, 12)
                    
                }
                .padding(.top, 2)
                .padding(.horizontal, 24)
                
                HStack (alignment: .top){
                    Image ("CatAssumption")
                        .resizable()
                        .frame(width: 46, height: 46)
                        .clipShape(Circle())
                        .padding(.vertical, 10)
                        .overlay(Circle()
                            .stroke(Color("Green800"), lineWidth: 6)
                            .opacity(0.6))
                    //                        .shadow(radius: 4)
                    
                    VStack (alignment: .leading){
                        Text ("Suara")
                            .multilineTextAlignment(.leading)
                            .font(.custom("", size: 22))
                            .fontWeight(.medium)
                            .foregroundColor(Color("neutral800"))
                            .fontDesign(.rounded)
                            .padding(.top, 18)
                            .padding(.bottom, 1)
                        
                        Text ("Suara kucing merupakan salah satu indikator yang dapat diobservasi untuk mengetahui kebutuhan kucing.")
                            .multilineTextAlignment(.leading)
                            .font(.custom("", size: 14))
                            .fontWeight(.regular)
                            .foregroundColor(Color("neutral600"))
                            .fontDesign(.rounded)
                        
                        ForEach(suaraLists){ itm in
                            HStack {
                                Image (itm.img)
                                    .resizable()
                                    .frame(width: 40, height: 40)
                                    .clipShape(Circle())
                                //                                .padding()
                                    .overlay(Circle()
                                        .stroke(Color("Green800"), lineWidth: 4)
                                        .opacity(0.6))
                                
                                Text (itm.label)
                                    .multilineTextAlignment(.leading)
                                    .font(.custom("", size: 14))
                                    .fontWeight(.regular)
                                    .foregroundColor(Color("neutral700"))
                                    .fontDesign(.rounded)
                                    .padding(.leading, 8)
                            } .padding(.top, 6)
                        }
                        
                    }
                    .padding(.leading, 12)
                    
                }
                .padding(.top, 2)
                .padding(.horizontal, 24)
                
                HStack (alignment: .top){
                    Image ("CatAssumption")
                        .resizable()
                        .frame(width: 46, height: 46)
                        .clipShape(Circle())
                        .padding(.vertical, 10)
                        .overlay(Circle()
                            .stroke(Color("Green800"), lineWidth: 6)
                            .opacity(0.6))
                    //                        .shadow(radius: 4)
                    
                    VStack (alignment: .leading){
                        Text ("Telinga")
                            .multilineTextAlignment(.leading)
                            .font(.custom("", size: 22))
                            .fontWeight(.medium)
                            .foregroundColor(Color("neutral800"))
                            .fontDesign(.rounded)
                            .padding(.top, 18)
                            .padding(.bottom, 1)
                        
                        Text ("Telinga kucing merupakan salah satu indikator yang dapat diobservasi untuk mengetahui kebutuhan kucing.")
                            .multilineTextAlignment(.leading)
                            .font(.custom("", size: 14))
                            .fontWeight(.regular)
                            .foregroundColor(Color("neutral600"))
                            .fontDesign(.rounded)
                        
                        ForEach(telingaLists){ itm in
                            HStack {
                                Image (itm.img)
                                    .resizable()
                                    .frame(width: 40, height: 40)
                                    .clipShape(Circle())
                                //                                .padding()
                                    .overlay(Circle()
                                        .stroke(Color("Green800"), lineWidth: 4)
                                        .opacity(0.6))
                                
                                Text (itm.label)
                                    .multilineTextAlignment(.leading)
                                    .font(.custom("", size: 14))
                                    .fontWeight(.regular)
                                    .foregroundColor(Color("neutral700"))
                                    .fontDesign(.rounded)
                                    .padding(.leading, 8)
                            } .padding(.top, 6)
                        }
                        
                    }
                    .padding(.leading, 12)
                    
                }
                .padding(.top, 2)
                .padding(.horizontal, 24)
                
            }
            
            
        }
        
    }
}

struct InformationView_Previews: PreviewProvider {
    static var previews: some View {
        InformationView()
    }
}
