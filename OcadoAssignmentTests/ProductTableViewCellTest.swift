//
//  ProductTableViewCellTest.swift
//  OcadoAssignmentTests
//
//  Created by Ahmer Hassan on 03/05/2022.
//

import XCTest
@testable import OcadoAssignment
import RxSwift

class ProductTableViewCellTest: XCTestCase {
    
    let sut = ProductCatalogTableViewCellViewModel(cluster: ProductsResponseModel.mockedCluster)
    private let disposeBag = DisposeBag()
    func testReusableIdentifier() {
        XCTAssertFalse(sut.reusableIdentifier.isEmpty)
        XCTAssertTrue(!sut.reusableIdentifier.isEmpty)
        XCTAssertEqual(sut.reusableIdentifier, "ProductCatalogTableViewCell")
    }
    
    func testTitleLabel()  {
        sut.clusterHeaderTitle.subscribe(onNext: { value in
            XCTAssertTrue(!value.isEmpty)
            XCTAssertFalse(value.isEmpty)
            XCTAssertEqual("Bananas", value)
        }).disposed(by: disposeBag)
    }
    
    func testDataSource(){
        sut.dataSource.subscribe(onNext: { value in
            XCTAssertNotNil(value)
            XCTAssertTrue(value.count > 0)
            XCTAssertFalse(value.isEmpty)
        }).disposed(by: disposeBag)
    }
}
