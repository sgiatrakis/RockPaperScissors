//
//  BaseData.swift
//  RockPaperScissors
//
//  Created by Lysimachos Giatrakis on 14/1/22.
//

import RealmSwift

public class BaseData {
    var realm: Realm!
 
    init(realm: Realm) {
        self.realm = realm
    }
    
    func create<T: Object>(_ object: T) -> Bool {
        do {
            try realm?.write {
                realm?.add(object)
                realm?.refresh()
            }
            return true
        } catch {
            print(error)
            return false
        }
    }

    func update(_ object: Object, with dictionary: [String: Any]) -> Bool {
        do {
            try realm?.write {
                for (key, value) in dictionary {
                    object.setValue(value, forKey: key)
                }
            }
            return true
        } catch {
            print(error)
            return false
        }
    }

    func delete<T: Object>(_ object: T) -> Bool {
        do {
            try realm?.write {
                realm?.delete(object)
                realm?.refresh()
            }
            return true
        } catch {
            print(error)
            return false
        }
    }
}
