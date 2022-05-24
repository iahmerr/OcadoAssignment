//
//  ProductsDetailsModel.swift
//  OcadoAssignment
//
//  Created by Ahmer Hassan on 30/04/2022.
//

import Foundation
struct ProductsDetailsModel: Decodable {
    let id: Int
    let price, title,description: String
    let imageURL: String
    let allergyInformation: String

    enum CodingKeys: String, CodingKey {
        case id, price, title,description
        case imageURL = "imageUrl"
        case allergyInformation
    }
}
