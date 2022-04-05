//
//  NutritionalAPIProtocol.swift
//  LifesumCC
//
//  Created by Paulo Silva on 02/04/2022.
//

import Foundation

protocol NutritionalAPIProtocol {
    
    func fetchDataFor(foodId: Int, completion: @escaping (Result<NutritionalInformation, NutritionalAPIError>) -> Void, urlSession: URLSession)
}
