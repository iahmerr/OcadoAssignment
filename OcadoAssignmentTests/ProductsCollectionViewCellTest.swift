//
//  ProductsCollectionViewCellTest.swift
//  OcadoAssignmentTests
//
//  Created by Ahmer Hassan on 03/05/2022.
//

import XCTest
@testable import OcadoAssignment
import RxSwift

class ProductsCollectionViewCellTest: XCTestCase {
    
    let sut = ProductsCollectionViewCellViewModel(item: ProductsResponseModel.mockedCluster.items[0])
    private let disposeBag = DisposeBag()
    
    func testProductId()  {
        XCTAssertEqual(sut.productId, 309396011)
    }
    
    func testProductTitle() {
        sut.productTitle.subscribe(onNext: { value in
            XCTAssertTrue(!value.isEmpty)
            XCTAssertFalse(value.isEmpty)
            XCTAssertEqual("Ocado Organic Fairtrade Bananas", value)
        }).disposed(by: disposeBag)
    }
    
    func testProductPrice() {
        sut.productPrice.subscribe(onNext: { value in
            XCTAssertTrue(!value.isEmpty)
            XCTAssertFalse(value.isEmpty)
            XCTAssertEqual("€ 1.45", value)
        }).disposed(by: disposeBag)
    }
    
    func testProductImage() {
        sut.productImage.subscribe(onNext: { value in
            XCTAssertNotNil(value)
            XCTAssertEqual(value.0, "https://mobile.ocado.com/webservices/catalogue/items/item/309396011/images/image/0/240x240.jpg")
            XCTAssertEqual(value.1, UIImage(named: "placeHolder"))
        }).disposed(by: disposeBag)
    }

}
