//
//  ProductsRouter.swift
//  OcadoAssignment
//
//  Created by Ahmer Hassan on 30/04/2022.
//

import Foundation

struct ProductionServer {
    static var host = "my-json-server.typicode.com"
}
public protocol URLRequestConvertible {
    func urlRequest()  -> URLRequest?
}
enum Router<T>: URLRequestConvertible {
    
    case getProducts(T)
    case getProductDetail(T)
    
    private var scheme: String {
        switch self {
        case .getProducts, .getProductDetail:
            return "https"
        }
    }
    private var host: String {
        switch self {
        case .getProducts, .getProductDetail:
            return ProductionServer.host
        }
    }
    private var path: String {
        switch self {
        case .getProducts:
            return  "/ocadotechnology/mobile-challenge/products"
        case .getProductDetail(let param):
            let request = param as! Int
            return  "/ocadotechnology/mobile-challenge/product/\(request)"
        }
    }
    
    private var method: String {
        switch self {
        case .getProducts, .getProductDetail:
            return "GET"
        }
    }
    
    func urlRequest() -> URLRequest? {
        
        var components = URLComponents()
        
        components.scheme = self.scheme
        components.host = self.host
        components.path = self.path
        
        guard let url = components.url else {
            assert(true,"url not formed")
            return nil
        }
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = self.method
        
        return urlRequest
    }
}
