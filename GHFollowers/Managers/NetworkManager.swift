//
//  NetworkManager.swift
//  GHFollowers
//
//  Created by Patryk Pawlak on 06/04/2020.
//  Copyright © 2020 Patryk Pawlak. All rights reserved.
//

import Foundation

class NetworkManager {
    static let shared = NetworkManager()
    let baseURL = "https://api.github.com/users/"
    
    private init() {}

    func getFollowers(for username: String, page: Int, completed: @escaping (Result<[Follower], GFError>) -> Void) {
        let endpoint = baseURL + "\(username)/followers?per_page=50&page\(page)"
        guard let url = URL(string: endpoint) else {
            completed(.failure(GFError.invaludUsername))
            return
        }

        let task = URLSession.shared.dataTask(with: url) { (data, res, error) in
            if let _ = error {
                completed(.failure(GFError.unableToComplete))
                return
            }
            guard let res = res as? HTTPURLResponse, res.statusCode == 200 else {
                completed(.failure(GFError.invalidResponse))
                return
            }
            guard let data = data else {
                completed(.failure(GFError.invalidData))
                return
            }

            do {
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                let followers = try decoder.decode([Follower].self, from: data)
                completed(.success(followers))
            } catch {
                completed(.failure(GFError.invalidData))
            }
        }
        task.resume()

    }
    
// OLD STYLE
//    func getFollowers(for username: String, page: Int, completed: @escaping ([Follower]?, ErrorMessage?) -> Void) {
//        let endpoint = baseURL + "\(username)/followers?per_page=50&page\(page)"
//        guard let url = URL(string: endpoint) else {
//            completed(nil, ErrorMessage.invaludUsername)
//            return
//        }
//
//        let task = URLSession.shared.dataTask(with: url) { (data, res, error) in
//            if let _ = error {
//                completed(nil, ErrorMessage.unableToComplete)
//                return
//            }
//            guard let res = res as? HTTPURLResponse, res.statusCode == 200 else {
//                completed(nil, ErrorMessage.invalidResponse)
//                return
//            }
//            guard let data = data else {
//                completed(nil, ErrorMessage.invalidData)
//                return
//            }
//
//            do {
//                let decoder = JSONDecoder()
//                decoder.keyDecodingStrategy = .convertFromSnakeCase
//                let followers = try decoder.decode([Follower].self, from: data)
//                completed(followers, nil)
//            } catch {
//                completed(nil, ErrorMessage.invalidData)
//            }
//        }
//        task.resume()
//
//    }
}
