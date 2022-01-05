//
//  Network.swift
//  RockPaperScissors
//
//  Created by Lysimachos Giatrakis on 5/1/22.
//

import Foundation
import Alamofire

public typealias btcPricesResponse = (BTCPrices?, Error?) -> Void

final class Network {
    
    public static let shared = Network()
    
    public func fetchBTCPrices(completion: @escaping btcPricesResponse) {
        let requestBuilder = RequestBuilder.fetchBTCPrices
        AF.request(requestBuilder).responseJSON { response in
            switch response.result {
            case .success(_ ):
                do {
                    let result = try JSONDecoder().decode(BTCPrices.self, from: response.data!)
                    completion(result, nil)
                } catch let translationError {
                    print("Fetch Prices Data.\(#function) error:", translationError)
                    let error = NSError(domain:"", code:400, userInfo:[ NSLocalizedDescriptionKey: "Fetch Prices Data - Response Translation Error"])
                    completion(nil, error)
                }
                
            case .failure(let error):
                let error = NSError(domain:"", code:400, userInfo:[ NSLocalizedDescriptionKey: error])
                completion(nil, error)
            }
        }
    }
    
}
