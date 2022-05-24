//
//  ProductsModel.swift
//  OcadoAssignment
//
//  Created by Ahmer Hassan on 30/04/2022.
//

import Foundation

struct ProductsResponseModel: Decodable {
    let clusters: [Cluster]
}

// MARK: - Cluster
struct Cluster: Decodable {
    let tag: String
    let items: [Item]
}

// MARK: - Item
struct Item: Decodable {
    let id: Int
    let price, title, size: String
    let imageURL: String

    enum CodingKeys: String, CodingKey {
        case id, price, title, size
        case imageURL = "imageUrl"
    }
}

public struct AppError: Codable,Error, Equatable {
    let error : String
    
    static func generalError() -> AppError{
        return AppError(error: "some thing went wrong")
    }
}

extension AppError {
    private enum CodingKeys: String, CodingKey {
        case error = "Error"
    }
}

extension ProductsResponseModel {
    static var mockedCluster: Cluster{
        return Cluster(tag: "Bananas", items: [Item (id: 309396011,
                                                     price: "1.45",
                                                     title: "Ocado Organic Fairtrade Bananas",
                                                     size: "6 per pack",
                                                     imageURL: "https://mobile.ocado.com/webservices/catalogue/items/item/309396011/images/image/0/240x240.jpg")])
    }
}
