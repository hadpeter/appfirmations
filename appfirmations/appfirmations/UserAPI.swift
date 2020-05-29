//
//  UserAPI.swift
//  appfirmations
//
//  Created by Hadley Peterson on 5/27/20.

import UIKit

class UsersAPI {
    
    static let sharedInstance: UsersAPI = UsersAPI()
    private var userDetails: [User]? = [User]()
    
    private init() {
        loadDataFromUserDefaults()
    }
    
    private func loadDataFromUserDefaults() {
        if let userDetailsData = UserDefaults.standard.value(forKey: "userDetails") as? Data {
            // userDetails = try? PropertyListDecoder().decode(Array<User>.self, from: userDetailsData)
        }
    }
    
    func getUser(byName userName: String) -> User? {
        return User(name: userName)// userDetails?.filter { $0.userName == userName }.first
    }
}
