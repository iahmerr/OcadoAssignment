//
//  ProductsServices.swift
//  OcadoAssignment
//
//  Created by Ahmer Hassan on 30/04/2022.
//

import Foundation

protocol ProductsService {
    func fetchProducts(completion: @escaping(Result<ProductsResponseModel?,AppError>) -> Void)
    func fetchProductDetail(for productId: Int, completion: @escaping(Result<ProductsDetailsModel?,AppError>) -> Void)
}

class ProductsServiceProvider: ProductsService {
    
    private let apiConvertible:ApiService
    
    init(apiConvertible: ApiService = APIClient()){
        self.apiConvertible = apiConvertible
    }
    
    func fetchProducts(completion: @escaping(Result<ProductsResponseModel?,AppError>) -> Void) {
        let router = Router.getProducts((Any).self)
        apiConvertible.performRequest(router: router) { (result:Result<ProductsResponseModel, AppError>) in
            switch result{
            case .failure(let error):
                completion(.failure(error))
            case .success(let data):
                completion(.success(data))
            }
        }
    }
    
    func fetchProductDetail(for productId: Int, completion: @escaping (Result<ProductsDetailsModel?, AppError>) -> Void) {
        let router = Router.getProductDetail(productId)
        apiConvertible.performRequest(router: router) { (result:Result<ProductsDetailsModel, AppError>) in
            switch result{
            case .failure(let error):
                completion(.failure(error))
            case .success(let data):
                completion(.success(data))
            }
        }
    }
}
