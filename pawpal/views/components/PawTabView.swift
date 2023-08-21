//
//  TabView.swift
//  pawpal
//
//  Created by Nur Izza Latifah on 12/06/23.
//

import SwiftUI

struct PawTabView: View {
    @State private var selectedTab: Int = 0
    
    var body: some View {
        TabView(selection: $selectedTab) {
            NavigationView{
                PawView()
                
            }
            .tabItem {
                Image(selectedTab == 0 ? "paw" : "paw-un")
                    .resizable()
                
                Text("Paw")
            }
            .tag(0)
            
            NavigationView {
                LogView()
            }
            .tabItem {
                Image(selectedTab == 1 ? "log" : "log-un")
                Text("Log")
            }
            .tag(1)
        }
        
        .accentColor(Color("orange600")) // Warna saat tab aktif
        .onAppear {
            UITabBar.appearance().unselectedItemTintColor = .gray // Warna saat tab tidak aktif
        }
    }
}
