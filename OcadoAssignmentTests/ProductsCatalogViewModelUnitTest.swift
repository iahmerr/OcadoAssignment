//
//  ProductsCatalogViewModelUnitTest.swift
//  OcadoAssignmentTests
//
//  Created by Ahmer Hassan on 03/05/2022.
//

import XCTest
@testable import OcadoAssignment
import RxSwift

class ProductsCatalogViewModelUnitTest: XCTestCase {

    let sut = ProductsCatalogViewModel(repository: ProductsRepository())
    private let disposeBag = DisposeBag()

    func testTableViewDataSource() {
        let productsScreenDataSourceExpectation = expectation(description: "ProductsScreenDataSourceExpectation")
        // skipping 1 due to default value
        sut.dataSource.skip(1).subscribe(onNext: { value in
            XCTAssertNotNil(value)
            XCTAssertTrue(value.count > 0)
            XCTAssertFalse(value.isEmpty)
        }).disposed(by: disposeBag)
        
        productsScreenDataSourceExpectation.fulfill()
        waitForExpectations(timeout: 3)
    }
    
    func testShowLoader() {
        let showLoaderExpectations = expectation(description: "ShowLoaderExpectations")
        sut.showLoader.skip(1).subscribe(onNext: { value in
            XCTAssertTrue(value == true)
            XCTAssertFalse(value == false)
            XCTAssertNotNil(value)
        }).disposed(by: disposeBag)
        
        showLoaderExpectations.fulfill()
        waitForExpectations(timeout: 2)
    }
}
