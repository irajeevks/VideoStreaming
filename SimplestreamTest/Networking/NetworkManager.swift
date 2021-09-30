//
//  NetworkManager.swift
//  SimplestreamTest
//
//  Created by RAjeev Singh on 14/07/2021.
//

import Foundation

protocol NetworkManagerProtocol {
    func fetchCategories(fromURLString urlString: String,
                          completion: @escaping (Result<Data, Error>) -> Void)
}

class NetworkManager: NetworkManagerProtocol {
        
    func fetchCategories(fromURLString urlString: String,
                          completion: @escaping (Result<Data, Error>) -> Void) {
        if let url = URL(string: urlString) {
            let urlSession = URLSession(configuration: .default).dataTask(with: url) { (data, response, error) in
                if let error = error {
                    completion(.failure(error))
                }
                
                if let data = data {
                    completion(.success(data))
                }
            }
            
            urlSession.resume()
        }
    }

}
