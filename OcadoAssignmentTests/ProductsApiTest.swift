//
//  OcadoAssignmentTests.swift
//  OcadoAssignmentTests
//
//  Created by Ahmer Hassan on 02/05/2022.
//

import XCTest
@testable import OcadoAssignment

class ProductsApiTest: XCTestCase {
    
    let sut = ProductsRepository()
    
    func test_SuccessGetProductsServerCall() throws {
//        let productsExpectation = expectation(description: "ProductsExpectation")
//        sut.fetchProducts { result in
//            XCTAssertNotNil(result)
//            switch result{
//            case .success(let response):
//                XCTAssertNotNil(response)
//                XCTAssertNotNil(response!.clusters)
//                XCTAssertTrue((response!.clusters.count) > 0)
//                XCTAssertNotNil(response!.clusters[0].items)
//                XCTAssertTrue((response!.clusters.count > 0))
//            case .failure(let err):
//                XCTAssertNotNil(err)
//            }
//            productsExpectation.fulfill()
//        }
//        waitForExpectations(timeout: 3, handler: nil)
    }

    func test_SuccessAppError() throws {
        XCTAssertEqual(AppError.generalError(), AppError(error: "some thing went wrong"))
    }
}
