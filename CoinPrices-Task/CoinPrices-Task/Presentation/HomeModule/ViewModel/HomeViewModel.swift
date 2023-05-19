//
//  HomeViewModel.swift
//  CoinPrices-Task
//
//  Created by admin on 19/05/2023.
//

import Foundation
import Combine

class HomeViewModel: ObservableObject {
    
    @Published var allCoins: [CoinModel] = []
    @Published var isLoading:Bool = false

    var subscriptions = Set<AnyCancellable>()
    
    init() {
        getCoinsPrices()
    }
    
    func getCoinsPrices() {
        self.isLoading = true
        let service = CoinsService(networkRequest: NativeRequestable(), environment: .development)
        service.getCoins()
            .sink { (completion) in
                self.isLoading = false
                switch completion {
                case .failure(let error):
                    print("oops got an error \(error.localizedDescription)")
                case .finished:
                    print("nothing much to do here")
                }
            } receiveValue: { (coinsModel) in
                self.allCoins = coinsModel
                print("got my response here \(coinsModel)")
            }
            .store(in: &subscriptions)
    }
}
