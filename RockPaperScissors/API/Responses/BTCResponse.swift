//
//  BTCResponse.swift
//  RockPaperScissors
//
//  Created by Lysimachos Giatrakis on 5/1/22.
//

import Foundation

public struct BTCPrices: Decodable {
    
    public var time: TimeObject
    public var chartName: String
    public var bpi: BPIObject
    
    private enum CodingKeys: String, CodingKey {
        case time
        case bpi
        case chartName
    }
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        time = try container.decode(TimeObject.self, forKey: .time)
        chartName = try container.decode(String.self, forKey: .chartName)
        bpi = try container.decode(BPIObject.self, forKey: .bpi)
    }

}

public struct TimeObject: Decodable {
    
    public var updateduk: String

    private enum CodingKeys: String, CodingKey {
        case updateduk
    }
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        updateduk = try container.decode(String.self, forKey: .updateduk)
    }
    
}


public struct BPIObject: Decodable {
    
    public var usd: USDObject

    private enum CodingKeys: String, CodingKey {
        case USD
    }
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        usd = try container.decode(USDObject.self, forKey: .USD)
    }
    
}

public struct USDObject: Decodable {
    
    public var code: String
    public var rateText: String
    public var rate: Double

    private enum CodingKeys: String, CodingKey {
        case code
        case rate
        case rate_float
    }
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        code = try container.decode(String.self, forKey: .code)
        rateText = try container.decode(String.self, forKey: .rate)
        rate = try container.decode(Double.self, forKey: .rate_float)
    }
    
}
