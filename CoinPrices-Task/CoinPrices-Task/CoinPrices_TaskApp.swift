//
//  CoinPrices_TaskApp.swift
//  CoinPrices-Task
//
//  Created by admin on 19/05/2023.
//

import SwiftUI

@main
struct CoinPrices_TaskApp: App {
    
    @StateObject private var vm = HomeViewModel()
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
                HomeView()
                    .navigationBarHidden(false)
            }
            .environmentObject(vm)
        }
    }
}
