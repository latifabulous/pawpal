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
                    .font(.title)
                    .fontWeight(.semibold)
                    .foregroundColor(Color("neutral800"))
                    .fontDesign(.rounded)
                    .padding(.bottom, 20)
                    .padding(.top, 40)
            
                
                ScrollView(.vertical) {
                    
                    VStack {
                        Text ("Pupil")
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .font(.title2)
                            .fontWeight(.semibold)
                            .foregroundColor(Color("neutral800"))
                            .fontDesign(.rounded)
                            .padding(.top, 24)
                            .padding(.bottom, 1)
                        
                        Text ("Pupil kucing merupakan salah satu indikator yang dapat diobservasi untuk mengetahui kebutuhan kucing.")
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .font(.subheadline)
                            .fontWeight(.regular)
                            .foregroundColor(Color("neutral600"))
                            .fontDesign(.rounded)
                    }
                        
                    ForEach(pupilLists){ itm in
                            HStack {

                                Image (itm.img)
                                    .resizable()
                                    .frame(width: 111, height: 111)
                                    .padding(.vertical, 24)
                                    .padding(.trailing, 24)
                                
                                VStack {
                                    Text (itm.label)
                                        .frame(maxWidth: .infinity, alignment: .leading)
                                        .font(.headline)
                                        .fontWeight(.semibold)
                                        .foregroundColor(Color("neutral700"))
                                        .fontDesign(.rounded)
                                    
                                    Text (itm.deskripsi)
                                        .frame(maxWidth: .infinity, alignment: .leading)
                                        .font(.system(size: 14))
                                        .fontWeight(.regular)
                                        .foregroundColor(Color("neutral600"))
                                        .fontDesign(.rounded)
                                }
                                
                                
                            } .padding(.top, 6)
                        }

                    
                    
                    VStack {
                        Text ("Ekor")
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .font(.title2)
                            .fontWeight(.semibold)
                            .foregroundColor(Color("neutral800"))
                            .fontDesign(.rounded)
                            .padding(.top, 24)
                            .padding(.bottom, 1)
                        
                        Text ("Ekor kucing merupakan salah satu indikator yang dapat diobservasi untuk mengetahui kebutuhan kucing.")
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .font(.subheadline)
                            .fontWeight(.regular)
                            .foregroundColor(Color("neutral600"))
                            .fontDesign(.rounded)
                    }
                    
                        
                    ForEach(ekorLists){ itm in
                            HStack {

                                Image (itm.img)
                                    .resizable()
                                    .frame(width: 111, height: 111)
                                    .padding(.vertical, 24)
                                    .padding(.trailing, 24)
                                
                                VStack {
                                    Text (itm.label)
                                        .frame(maxWidth: .infinity, alignment: .leading)
                                        .font(.headline)
                                        .fontWeight(.semibold)
                                        .foregroundColor(Color("neutral700"))
                                        .fontDesign(.rounded)
                                    
                                    Text (itm.deskripsi)
                                        .frame(maxWidth: .infinity, alignment: .leading)
                                        .font(.system(size: 14))
                                        .fontWeight(.regular)
                                        .foregroundColor(Color("neutral600"))
                                        .fontDesign(.rounded)
                                }
                                
                                
                            } .padding(.top, 6)
                        }
                    
                    
                    VStack {
                        Text ("Telinga")
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .font(.title2)
                            .fontWeight(.semibold)
                            .foregroundColor(Color("neutral800"))
                            .fontDesign(.rounded)
                            .padding(.top, 24)
                            .padding(.bottom, 1)
                        
                        Text ("Telinga kucing merupakan salah satu indikator yang dapat diobservasi untuk mengetahui kebutuhan kucing.")
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .font(.subheadline)
                            .fontWeight(.regular)
                            .foregroundColor(Color("neutral600"))
                            .fontDesign(.rounded)
                    }
                    
                    ForEach(telingaLists){ itm in
                            HStack {

                                Image (itm.img)
                                    .resizable()
                                    .frame(width: 111, height: 111)
                                    .padding(.vertical, 24)
                                    .padding(.trailing, 24)
                                
                                VStack {
                                    Text (itm.label)
                                        .frame(maxWidth: .infinity, alignment: .leading)
                                        .font(.headline)
                                        .fontWeight(.semibold)
                                        .foregroundColor(Color("neutral700"))
                                        .fontDesign(.rounded)
                                    
                                    Text (itm.deskripsi)
                                        .frame(maxWidth: .infinity, alignment: .leading)
                                        .font(.system(size: 14))
                                        .fontWeight(.regular)
                                        .foregroundColor(Color("neutral600"))
                                        .fontDesign(.rounded)
                                }
                                
                                
                            } .padding(.top, 6)
                        }
                    
                    VStack {
                        Text ("Suara")
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .font(.title2)
                            .fontWeight(.semibold)
                            .foregroundColor(Color("neutral800"))
                            .fontDesign(.rounded)
                            .padding(.top, 24)
                            .padding(.bottom, 1)
                        
                        Text ("Suara kucing merupakan salah satu indikator yang dapat diobservasi untuk mengetahui kebutuhan kucing.")
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .font(.subheadline)
                            .fontWeight(.regular)
                            .foregroundColor(Color("neutral600"))
                            .fontDesign(.rounded)
                    }

                    ForEach(suaraLists){ itm in
                            HStack {

                                Image (itm.img)
                                    .resizable()
                                    .frame(width: 111, height: 111)
                                    .padding(.vertical, 24)
                                    .padding(.trailing, 24)
                                
                                VStack {
                                    Text (itm.label)
                                        .frame(maxWidth: .infinity, alignment: .leading)
                                        .font(.headline)
                                        .fontWeight(.semibold)
                                        .foregroundColor(Color("neutral700"))
                                        .fontDesign(.rounded)
                                    
                                    Text (itm.deskripsi)
                                        .frame(maxWidth: .infinity, alignment: .leading)
                                        .font(.system(size: 14))
                                        .fontWeight(.regular)
                                        .foregroundColor(Color("neutral600"))
                                        .fontDesign(.rounded)
                                }
                                
                                
                            } .padding(.top, 6)
                        }
                    
                    
                    
                    VStack {
                        Text ("Bentuk Badan")
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .font(.title2)
                            .fontWeight(.semibold)
                            .foregroundColor(Color("neutral800"))
                            .fontDesign(.rounded)
                            .padding(.top, 24)
                            .padding(.bottom, 1)
                        
                        Text ("Bentuk badan kucing merupakan salah satu indikator yang dapat diobservasi untuk mengetahui kebutuhan kucing.")
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .font(.subheadline)
                            .fontWeight(.regular)
                            .foregroundColor(Color("neutral600"))
                            .fontDesign(.rounded)
                    }
                    ForEach(bentukBadanLists){ itm in
                            HStack {

                                Image (itm.img)
                                    .resizable()
                                    .frame(width: 111, height: 111)
                                    .padding(.vertical, 24)
                                    .padding(.trailing, 24)
                                
                                VStack {
                                    Text (itm.label)
                                        .frame(maxWidth: .infinity, alignment: .leading)
                                        .font(.headline)
                                        .fontWeight(.semibold)
                                        .foregroundColor(Color("neutral700"))
                                        .fontDesign(.rounded)
                                    
                                    Text (itm.deskripsi)
                                        .frame(maxWidth: .infinity, alignment: .leading)
                                        .font(.system(size: 14))
                                        .fontWeight(.regular)
                                        .foregroundColor(Color("neutral600"))
                                        .fontDesign(.rounded)
                                }
                                
                                
                            } .padding(.top, 6)
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
