//
//  NutritionalInformation.swift
//  LifesumCC
//
//  Created by Paulo Silva on 02/04/2022.
//

import Foundation

struct NutritionalInformation: Decodable {
    let meta: NutritionalMeta?
    let response: NutritionalResponse?

    enum CodingKeys: String, CodingKey {
        case meta = "meta"
        case response = "response"
    }
}
