//
//  CoinsService.swift
//  CoinPrices-Task
//
//  Created by admin on 19/05/2023.
//

import Combine

protocol CoinsServiceable {
    func getCoins() -> AnyPublisher<[CoinModel], NetworkError>
}

class CoinsService: CoinsServiceable {
    
    private var networkRequest: Requestable
    private var environment: Environment = .development
    
  // inject this for testability
    init(networkRequest: Requestable, environment: Environment) {
        self.networkRequest = networkRequest
        self.environment = environment
    }

    func getCoins() -> AnyPublisher<[CoinModel], NetworkError> {
        let endpoint = ServiceEndpoints.getCoinsPrices
        let request = endpoint.createRequest(token: "",
                                             environment: self.environment)
        return self.networkRequest.request(request)
    }
  
}
