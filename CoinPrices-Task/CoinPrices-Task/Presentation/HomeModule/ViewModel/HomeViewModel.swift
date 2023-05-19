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
    // @Published var searchText: String = ""
    
    // private let dataService = CoinDataService()
    // private var cancellables = Set<AnyCancellable>()
    
    var subscriptions = Set<AnyCancellable>()
    
    
    init() {
        // addSubscribers()
        getCoinsPrices()
    }
    
    //    func addSubscribers() {
    //        self.isLoading = true
    //        //updates allCoins
    //        $searchText
    //            .combineLatest(dataService.$allCoins)
    //            .debounce(for: .seconds(0.5), scheduler: DispatchQueue.main)
    //            .map(filterCoins)
    //            .sink { [weak self] (returnedCoins) in
    //                self?.isLoading = false
    //                self?.allCoins = returnedCoins
    //            }
    //            .store(in: &cancellables)
    //    }
    
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
    
    //    private func filterCoins(text: String, coins: [CoinModel]) -> [CoinModel] {
    //        guard !text.isEmpty else {
    //            return coins
    //        }
    //
    //        let lowercasedText = text.lowercased()
    //
    //        return coins.filter { (coin) -> Bool in
    //            return coin.name.lowercased().contains(lowercasedText) ||
    //            coin.symbol.lowercased().contains(lowercasedText) ||
    //            coin.id.lowercased().contains(lowercasedText)
    //        }
    //    }
}
