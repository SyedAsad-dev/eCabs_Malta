//
//  File.swift
//  
//
//  Created by Rizvi Naqvi on 13/09/2024.
//

import Foundation
 
public enum AppDefaultsKeys : String {
    case baseUrl
}


internal class ValueWrapper<T: Codable> : Codable {
    var value: T
    
    init(value: T) {
        self.value = value
    }
}

class NetworkingAppDefault {
    
    public static let shared = NetworkingAppDefault()
    
    fileprivate init() {
    }
    
    fileprivate let userDefaults = UserDefaults.standard
    
    func save<T: Codable>(_ object: T, forKey key: AppDefaultsKeys) {
        let wrappedValue = ValueWrapper(value: object)
        guard let encoded = try? JSONEncoder().encode(wrappedValue) else { return }
        userDefaults.set(encoded, forKey: key.rawValue)
    }
    
    func get<T: Codable>(_ key: AppDefaultsKeys) -> T? {
        if let wrappedObjectData = userDefaults.value(forKey: key.rawValue) {
            do {
                let obj: ValueWrapper<T> = try JSONDecoder().decode(ValueWrapper<T>.self, from: wrappedObjectData as! Data)
                return obj.value
            }catch {
                return nil
            }
        }else{
            return nil
        }
    }
    
}






