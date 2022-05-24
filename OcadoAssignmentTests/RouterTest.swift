//
//  RouterTest.swift
//  OcadoAssignmentTests
//
//  Created by Ahmer Hassan on 02/05/2022.
//

import XCTest
@testable import OcadoAssignment

class RouterTest: XCTestCase {

    func test_ProductionURL() throws {
        XCTAssertNotNil(ProductionServer.host)
        XCTAssertEqual(ProductionServer.host, "my-json-server.typicode.com")
    }
    
    func test_RouterEnumTestGetProducts() {
        let router = Router.getProducts((Any).self)
        XCTAssertNotNil(router)
        
        XCTAssertEqual(router.urlRequest(), URLRequest(url: URL(string: "https://my-json-server.typicode.com/ocadotechnology/mobile-challenge/products")!))
        XCTAssertFalse(router.urlRequest()!.httpMethod!.isEmpty)
        XCTAssertEqual(router.urlRequest()!.httpMethod, "GET")
        XCTAssertEqual(router.urlRequest()!.httpBody, nil)
    }
    
    func test_RouterEnumTestGetProductDetail() {
        let router = Router.getProductDetail(386138011)
        XCTAssertNotNil(router)
        XCTAssertEqual(router.urlRequest(), URLRequest(url: URL(string: "https://my-json-server.typicode.com/ocadotechnology/mobile-challenge/product/386138011")!))
        XCTAssertFalse(router.urlRequest()!.httpMethod!.isEmpty)
        XCTAssertEqual(router.urlRequest()!.httpMethod, "GET")
        XCTAssertEqual(router.urlRequest()!.httpBody, nil)
    }
}
