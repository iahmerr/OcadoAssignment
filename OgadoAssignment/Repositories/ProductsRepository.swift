//
//  ProductsRepository.swift
//  OcadoAssignment
//
//  Created by Ahmer Hassan on 01/05/2022.
//

import Foundation

class ProductsRepository: AppRepository {
    
    func fetchProducts(completion: @escaping(Result<ProductsResponseModel?,AppError>)-> Void) {
        productService.fetchProducts(completion: completion)
    }
    
    func fetchProductDetail(productId: Int, completion: @escaping(Result<ProductsDetailsModel?,AppError>)-> Void) {
        productService.fetchProductDetail(for: productId, completion: completion)
    }
}
