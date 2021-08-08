//
//  SearchResponse.swift
//  GitHubSearchRepository
//
//  Created by mktbsh on 2020/11/07.
//

import Foundation

struct SearchResponse<Item : Decodable> : Decodable {
    let totalCount: Int
    let items: [Item]
    
    enum CodingKeys : String, CodingKey {
        case totalCount = "total_count"
        case items
    }
}
