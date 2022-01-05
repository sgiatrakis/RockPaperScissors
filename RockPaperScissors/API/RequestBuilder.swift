//
//  RequestBuilder.swift
//  RockPaperScissors
//
//  Created by Lysimachos Giatrakis on 5/1/22.
//

import Foundation
import Alamofire

enum RequestBuilder: URLRequestConvertible{
    
    // All Cases
    case fetchBTCPrices
    
    private var encoding: ParameterEncoding {
        return URLEncoding.default
    }
    
    private var httpMethod: HTTPMethod {
        return .get
    }
    
    func asURLRequest() throws -> URLRequest {
        // Full API path, just for the demo's purpose
        let apiString = "https://api.coindesk.com/v1/bpi/currentprice.json"
        let url = try apiString.asURL()
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = httpMethod.rawValue
        
        switch self {
        case .fetchBTCPrices:
            return try encoding.encode(urlRequest, with: nil)
        }
    }
    
}

