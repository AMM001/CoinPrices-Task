//
//  RequestableProtocol.swift
//  CoinPrices-Task
//
//  Created by admin on 19/05/2023.
//

import Combine
import Foundation

public protocol Requestable {
    var requestTimeOut: Float { get }
    func request<T: Codable>(_ req: NetworkRequest) -> AnyPublisher<T, NetworkError>
}
