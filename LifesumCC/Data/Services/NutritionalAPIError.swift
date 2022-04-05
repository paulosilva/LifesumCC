//
//  NutritionalAPIError.swift
//  LifesumCC
//
//  Created by Paulo Silva on 02/04/2022.
//

import Foundation

enum NutritionalAPIError: Error {
    case badUrl
    case badRequest
    case failedDecoding
}
