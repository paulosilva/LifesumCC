//
//  NutritionalMeta.swift
//  LifesumCC
//
//  Created by Paulo Silva on 02/04/2022.
//

import Foundation

struct NutritionalMeta: Decodable {
    let code: Int?

    enum CodingKeys: String, CodingKey {
        case code = "code"
    }
}
