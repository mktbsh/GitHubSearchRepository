//
//  GitHubClient.swift
//  GitHubSearchRepository
//
//  Created by mktbsh on 2020/11/07.
//

import Foundation

class GitHubClient {
    private let session: URLSession = {
        let config = URLSessionConfiguration.default
        let session = URLSession(configuration: config)
        return session
    }()
    
    func send<Request : GitHubRequest>(
        request: Request,
        completion: @escaping (Result<Request.Response, GitHubClientError>) -> Void) {
        let urlRequest = request.buildURLRequest()
        let task = session.dataTask(with: urlRequest) {
            data, response, error in
            
            switch (data, response, error) {
            case (_, _, let error?):
                completion(Result(error: .connectionError(error)))
            case (let data?, let response?, _):
                do {
                    let response = try request.response(
                        from: data, urlResponse: response)
                    completion(Result(value: response))
                } catch let error as GitHubAPIError {
                    completion(Result(error: .apiError(error)))
                } catch {
                    completion(Result(error: .responseParseError(error)))
                }
            default:
                fatalError("invalid respnse combination \(String(describing: data)), \(String(describing: response)), \(String(describing: error)).")
            }
        }
        
        task.resume()
    }
}
