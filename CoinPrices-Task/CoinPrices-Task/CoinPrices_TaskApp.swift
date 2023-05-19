//
//  CoinPrices_TaskApp.swift
//  CoinPrices-Task
//
//  Created by admin on 19/05/2023.
//

import SwiftUI

@main
struct CoinPrices_TaskApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
