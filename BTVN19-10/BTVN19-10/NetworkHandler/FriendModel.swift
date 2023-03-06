//
//  FriendModel.swift
//  BTVN19-10
//
//  Created by Dương Văn Cường on 21/10/2022.
//

import Foundation

struct Friend: Codable {
        let name: String
        let avatar: String
        let id: String
    
    init(name: String, avatar: String, id: String){
        self.name = name
        self.avatar = avatar
        self.id = id
    }
}

typealias Friends = [Friend]

