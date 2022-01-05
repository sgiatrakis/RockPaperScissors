//
//  Repository.swift
//  RockPaperScissors
//
//  Created by Lysimachos Giatrakis on 5/1/22.
//

import Foundation

final class Repository {
    
    private var networkLayer: Network
    
    public static let shared = Repository()
    
    private init() {
        networkLayer = Network.shared
    }
    
    func fetchBTCPrices(completion: @escaping btcPricesResponse) {
        networkLayer.fetchBTCPrices { response, error in
            if let err = error {
                completion(nil, err)
                return
            }
            
            completion(response, nil)
        }
    }
}

