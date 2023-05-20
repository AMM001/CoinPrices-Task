//
//  ServiceEndpoints.swift
//  CoinPrices-Task
//
//  Created by admin on 19/05/2023.
//

public typealias Headers = [String: String]

// if you wish you can have multiple services like this in a project
enum ServiceEndpoints {
    
  // organise all the end points here for clarity
    case getCoinsPrices
    case getCoinImage(_ imageName:String)
  
  // gave a default timeout but can be different for each.
    var requestTimeOut: Int {
        return 20
    }
    
  //specify the type of HTTP request
    var httpMethod: HTTPMethod {
        switch self {
        case .getCoinsPrices:
            return .GET
        case .getCoinImage:
            return .GET
        }
    }
    
  // compose the NetworkRequest
    func createRequest(token: String, environment: Environment) -> NetworkRequest {
        let headers: Headers = [:]
//        headers["Content-Type"] = "application/json"
//        headers["Authorization"] = "Bearer \(token)"
        return NetworkRequest(url: getURL(from: environment), headers: headers, reqBody: requestBody, httpMethod: httpMethod)
    }
    
  // encodable request body for POST
    var requestBody: Encodable? {
        switch self {
        case .getCoinsPrices , .getCoinImage:
            return nil
        }
    }
    
  // compose urls for each request
    func getURL(from environment: Environment) -> String {
        let baseUrl = environment.serviceBaseUrl
        switch self {
        case .getCoinsPrices:
            return baseUrl
        case .getCoinImage(let imageName):
            return imageName
        }
    }
}
