//
//  RealmLayer.swift
//  RockPaperScissors
//
//  Created by Lysimachos Giatrakis on 14/1/22.
//

import Foundation
import RealmSwift

class RealmLayer {
    
    var realm: Realm!
    
    private static var privateShared: RealmLayer?
    
    public static var shared: RealmLayer {
        guard let uwShared = privateShared else {
            privateShared = RealmLayer()
            return privateShared!
        }
        return uwShared
    }
    
    var leaderBoardData: LeaderBoardData!
    
    static func destroy() {
        privateShared = nil
    }
    
    private init() {
        var config = Realm.Configuration()
        config.fileURL = config
            .fileURL!
            .deletingLastPathComponent()
            .appendingPathComponent("userdata.realm")
        config.schemaVersion = 1
        config.migrationBlock = { migration, oldSchemaVersion in
            // No need anything in this Demo
            if oldSchemaVersion < 1 {}
        }
        
        do {
            realm = try Realm(configuration: config)
        } catch let error as NSError {
            print(error)
        }
        
        leaderBoardData = LeaderBoardData(realm: realm)
    }
    
    deinit {
        print("deinit RealmLayer singleton")
    }

    
}

