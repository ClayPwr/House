//
//  UserDefaults+Local.swift
//  House
//
//  Created by User on 1/27/22.
//

import Foundation

@propertyWrapper
struct UserDefault<T: Codable> {
    let key: String
    let defaultValue: T
    let container: UserDefaults = .standard
    
    var wrappedValue: T {
        get {
            guard let data = container.object(forKey: key) as? Data else { return defaultValue }
            let value = try? JSONDecoder().decode(T.self, from: data)
            return value ?? defaultValue
        }
        set {
            let data = try? JSONEncoder().encode(newValue)
            container.set(data, forKey: key)
        }
    }
}

extension UserDefaults {
    public enum Keys {
        static let isUserLoggedIn = "isUserLoggedIn"
        static let userFullName = "userFullName"
        static let userEmail = "userEmail"
        static let userAppleAuthID = "userAppleAuthID"
        static let numberOfOrderedItems = "numberOfOrderedItems"
        static let orderHistory = "orderHistory"
    }
    
    @UserDefault(key: Keys.isUserLoggedIn, defaultValue: false)
    static var isUserLoggedIn: Bool
    
    /// The user’s name. if empty user exist
    @UserDefault(key: Keys.userFullName, defaultValue: PersonNameComponents())
    static var userFullName: PersonNameComponents
    
    /// The user’s email address. if empty user exist. if email is hidden suffix - @privaterelay.appleid.com.
    @UserDefault(key: Keys.userEmail, defaultValue: "")
    static var userEmail: String
    
    /// An identifier for the authenticated user.
    @UserDefault(key: Keys.userAppleAuthID, defaultValue: "")
    static var userAppleAuthID:  String
    
    /// A number of ordered same items
    @UserDefault(key: Keys.numberOfOrderedItems, defaultValue: [:])
    static var numberOfOrderedItems: [String: Int]
}
