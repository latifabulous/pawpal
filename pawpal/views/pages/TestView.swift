//
//  TestView.swift
//  pawpal
//
//  Created by Nur Izza Latifah on 12/06/23.
//

import SwiftUI

struct TestView: View {
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
                            .foregroundColor(Color("orange600"))
                            .background(
                                RoundedRectangle(cornerRadius: 20)
                                    .stroke(Color("orange600"), lineWidth: 1.5)
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
                                .foregroundColor(isMakan ? .white : Color("orange600"))
                                .background(
                                    RoundedRectangle(cornerRadius: 20)
                                        .stroke(Color("orange600"), lineWidth: 3)
                                        .background(isMakan ? Color("orange600") : .white)
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
                                .foregroundColor(isMinum ? .white : Color("orange600"))
                                .background(
                                    RoundedRectangle(cornerRadius: 20)
                                        .stroke(Color("orange600"), lineWidth: 3)
                                        .background(isMinum ? Color("orange600") : .white)
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
                                .foregroundColor(isBirahi ? .white : Color("orange600"))
                                .background(
                                    RoundedRectangle(cornerRadius: 20)
                                        .stroke(Color("orange600"), lineWidth: 3)
                                        .background(isBirahi ? Color("orange600") : .white)
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
                                .foregroundColor(isMain ? .white : Color("orange600"))
                                .background(
                                    RoundedRectangle(cornerRadius: 20)
                                        .stroke(Color("orange600"), lineWidth: 3)
                                        .background(isMain ? Color("orange600") : .white)
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
                                    .foregroundColor(isIstirahat ? .white : Color("orange600"))
                                    .background(
                                        RoundedRectangle(cornerRadius: 20)
                                            .stroke(Color("orange600"), lineWidth: 3)
                                            .background(isIstirahat ? Color("orange600") : .white)
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
                                    .foregroundColor(isLainnya ? .white : Color("orange600"))
                                    .background(
                                        RoundedRectangle(cornerRadius: 20)
                                            .stroke(Color("orange600"), lineWidth: 3)
                                            .background(isLainnya ? Color("orange600") : .white)
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
                            .foregroundColor(Color("green800")))
                        .foregroundColor(Color.white)
                }
                
                
            }
            .toolbar{
                ToolbarItem(placement: .navigationBarLeading) {
                    HStack {
                        Image(systemName: "chevron.left")
                            .fontWeight(.medium)
                            .foregroundColor(Color("green800"))
                        Text ("Kembali")
                            .fontWeight(.medium)
                            .foregroundColor(Color("green800"))
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

struct TestView_Previews: PreviewProvider {
    static var previews: some View {
        TestView()
    }
}


//ScrollView(.vertical, showsIndicators: false) {
//    
//    VStack (alignment: .leading, spacing: 8){
//        Text("Mari lakukan langkah langkah ini")
//            .font(.title2)
//            .fontWeight(.bold)
//            .fontDesign(.rounded)
//            .foregroundColor(Color("neutral800"))
//        
//        Text("ini akan membantumu mengetahui keinginan kucingmu.")
//            .font(.body)
//            .fontWeight(.medium)
//            .fontDesign(.rounded)
//            .foregroundColor(Color("neutral400"))
//    }
//    .padding(.horizontal, 24)
//    
//    Divider()
//        .padding(.horizontal, 24)
//    
//    VStack {
//        VStack{
//            Image("tutorial-foto")
//                .resizable()
//                .frame(width: 200, height: 200)
//            Text("AAAA")
//        }
//        
//        VStack{
//            Image("tutorial-drag")
//                .resizable()
//                .frame(width: 200, height: 200)
//            Text("AAAA")
//        }
//        
//        VStack{
//            Image("tutorial-log")
//                .resizable()
//                .frame(width: 200, height: 200)
//            Text("AAAA")
//        }
//    }
//    
//    Button(action: {
//        isShowingCamera = true
//    }) {
//        Image(systemName: "plus")
//            .font(.system(size:36))
//            .foregroundColor(Color("neutral10"))
//            .frame(width: 152, height: 152)
//            .background(
//                Circle()
//                    .fill(Color("orange600"))
//            )
//            .overlay(
//                RoundedRectangle(cornerRadius: 99)
//                                        .stroke(Color("orange200"), lineWidth: 15)
//                                        .opacity(1)
//            )
//    }
//    .padding()
//    .sheet(isPresented: $isShowingCamera) {
//        ImagePickerView(image: $selectedImage)
//    }
//    .padding(.bottom, 24)
//}
