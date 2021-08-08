//
//  Repository.swift
//  GitHubSearchRepository
//
//  Created by mktbsh on 2020/11/07.
//

import Foundation

struct Repository: Decodable {
    let id: Int
    let name: String
    let fullName: String
    let owner: User
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case fullName = "full_name"
        case owner
    }
}
