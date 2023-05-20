//
//  Environment.swift
//  CoinPrices-Task
//
//  Created by admin on 19/05/2023.
//

public enum Environment: String, CaseIterable {
    case development
    case staging
    case production
}

extension Environment {
    var serviceBaseUrl: String {
        switch self {
        case .development:
            return "https://api.coingecko.com/api/v3/coins/markets?vs_currency=brl&order=market_cap_desc&per_page=250&page=1&sparkline=true&price_change_percentage=24h"
        case .staging:
            return ""
        case .production:
            return ""
        }
    }
}
