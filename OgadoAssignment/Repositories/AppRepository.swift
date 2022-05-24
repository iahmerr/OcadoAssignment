//
//  AppRepository.swift
//  OcadoAssignment
//
//  Created by Ahmer Hassan on 01/05/2022.
//

import Foundation

public class AppRepository {
    public init() {}
    
    lazy var productService: ProductsService = {
        return ProductsServiceProvider()
    }()
}
