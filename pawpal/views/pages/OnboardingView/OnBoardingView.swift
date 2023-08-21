//
//  CobaOnBoarding.swift
//  pawpal
//
//  Created by ni nyoman putri shopia yuandari on 18/08/23.
//

import Foundation
import SwiftUI

struct HasCompletedOnboarding: View {
    @AppStorage("hasCompletedOnboarding")
    var hasCompletedOnboarding = false
    
    @ObservedObject var logModel: LogViewModel = LogViewModel()
    
    
    var body: some View {
        Group {
            if hasCompletedOnboarding {
                PawTabView().environmentObject(logModel)
            } else {
                OnBoardingView()
            }
        }
    }
}

// pindahin file
struct OnBoardingView: View {
    @AppStorage("username")
    var username = ""
    
    @State private var isUsernameEmpty = true
    @State var currentSteps: Int = 0
    
    var body: some View {
        VStack {
            if currentSteps < pageLists.count {
                ZStack {
                    Image (pageLists[self.currentSteps].image)
                        .resizable()
                        .scaledToFill()
                        .edgesIgnoringSafeArea(.all)
                    
                    VStack {
                        HStack {
                            Spacer()
                            Button(action: {
                                currentSteps = 3
                            }, label: {
                                Text("Lewati")
                                    .font(.system(size: 17, weight: .regular, design: .rounded))
                                    .foregroundColor(Color("orange600"))
                            })
                            .padding(.top, 40)
                        }
                        
                        Text(pageLists[self.currentSteps].description)
                            .font(.system(size: 20, weight: .semibold, design: .rounded))
                            .padding(.top, 24)
                        Spacer()
                        
                        ActionButton(action: {
                            if currentSteps < 2 {
                                currentSteps += 1
                            }
                            else {
                                currentSteps = 3
                            }
                        }, label: "Selanjutnya")
                    }
                    .padding(.bottom, 56)
                    .padding(.horizontal, 24)
                }
                
            } else if currentSteps == 3 {
                PawNameView(currentSteps: $currentSteps, username: $username, isUsernameEmpty: $isUsernameEmpty, background: "onboarding-4")
                
            } else if currentSteps == 4 {
                PawAgeView(currentSteps: $currentSteps, username: $username, background: "onboarding-5")
            }
        }
        .onDisappear {
            UserDefaults.standard.set(currentSteps, forKey: "currentSteps")
        }
    }
}

struct ContentView2_Previews: PreviewProvider {
    static var previews: some View {
        OnBoardingView()
    }
}
