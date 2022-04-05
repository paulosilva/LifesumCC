//
//  NutritionalAPIClient.swift
//  LifesumCC
//
//  Created by Paulo Silva on 02/04/2022.
//

import Foundation

class NutritionalAPIClient: NutritionalAPIProtocol {
    
    func fetchDataFor(foodId: Int, completion: @escaping (Result<NutritionalInformation, NutritionalAPIError>) -> Void, urlSession: URLSession = URLSession.shared) {
        
        /// Build Url for the request from settings
        let baseUrl = NutritionalAPISettings.urlStringWithId(foodId)
        guard let url = URL(string: baseUrl) else {
            completion(.failure(.badUrl))
            return
        }
        
        /// Headers form the settings
        var request = URLRequest(url: url)
        for header in NutritionalAPISettings.headers {
            request.setValue(header.value, forHTTPHeaderField: header.key)
        }
        
        /// Data task
        urlSession.dataTask(with: request) { (data, _, error) in
            guard let data = data, error == nil else {
                completion(.failure(.badRequest))
                return
            }
            
            /// Decode data
            do {
                let nutritionInformation = try JSONDecoder().decode(NutritionalInformation.self, from: data)
                
                completion(.success(nutritionInformation))
            } catch {
                completion(.failure(.failedDecoding))
            }
        }.resume()
    }
}
