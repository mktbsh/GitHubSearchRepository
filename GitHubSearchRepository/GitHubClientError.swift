//
//  GitHubClientError.swift
//  GitHubSearchRepository
//
//  Created by mktbsh on 2020/11/07.
//

import Foundation

enum GitHubClientError: Error {
    case connectionError(Error)
    
    case responseParseError(Error)
    
    case apiError(GitHubAPIError)
}
