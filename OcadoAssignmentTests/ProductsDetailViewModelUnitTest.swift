//
//  ProductsDetailViewModelUnitTest.swift
//  OcadoAssignmentTests
//
//  Created by Ahmer Hassan on 03/05/2022.
//

import XCTest
@testable import OcadoAssignment
import RxSwift

class ProductsDetailViewModelUnitTest: XCTestCase {

    let sutFailCase = ProductDetailViewModel(repository: ProductsRepository(), productId: 500000)
    let sutSuccessCase = ProductDetailViewModel(repository: ProductsRepository(), productId: 227255011)
    private let disposeBag = DisposeBag()
    
    func testShowLoader() {
//        let showLoaderExpectation = expectation(description: "ShowLoaderExpectations")
//
//        sutFailCase.showLoader.skip(1).subscribe(onNext: { value in
//            XCTAssertTrue(value)
//            XCTAssertNotNil(value)
//            XCTAssertFalse(!value)
//
//        }).disposed(by: disposeBag)
//
//        sutSuccessCase.showLoader.skip(1).subscribe(onNext: { value in
//            XCTAssertTrue(value)
//            XCTAssertNotNil(value)
//            XCTAssertFalse(!value)
//        }).disposed(by: disposeBag)
//
//        showLoaderExpectation.fulfill()
//        waitForExpectations(timeout: 3, handler: nil)
    }
    
    func testProductID(){
        
//        let productIdExpectation = expectation(description: "ProductsIdExpectation")
//        //Skip 1 for default value
//        sutFailCase.productId.skip(1).subscribe(onNext: { value in
//            XCTAssertFalse(!value.isEmpty)
//            XCTAssertTrue(value.isEmpty)
//            XCTAssertNotNil(value)
//        }).disposed(by: disposeBag)
//
//        sutSuccessCase.productId.skip(1).subscribe(onNext: { value in
//            XCTAssertTrue(!value.isEmpty)
//            XCTAssertFalse(value.isEmpty)
//            XCTAssertNotNil(value)
//            XCTAssertEqual("Product Id: 227255011", value)
//        }).disposed(by: disposeBag)
//
//        productIdExpectation.fulfill()
//        waitForExpectations(timeout: 5, handler: nil)
    }
    
    func testAlergicIngredients(){
        
//        let productIngredientsExpectation = expectation(description: "ProductsIngredientsExpectation")
//
//        //Skip 1 for default value
//        sutFailCase.productIngredients.skip(1).subscribe(onNext: { value in
//            XCTAssertFalse(!value.isEmpty)
//            XCTAssertTrue(value.isEmpty)
//            XCTAssertNotNil(value)
//        }).disposed(by: disposeBag)
//
//        sutSuccessCase.productIngredients.skip(1).subscribe(onNext: { value in
//            XCTAssertTrue(!value.isEmpty)
//            XCTAssertFalse(value.isEmpty)
//            XCTAssertNotNil(value)
//            XCTAssertEqual("Allergy Info: Factory also handles: Nuts, Peanuts, Sesame Seeds, Milk, Eggs", value)
//
//        }).disposed(by: disposeBag)
//        productIngredientsExpectation.fulfill()
//        waitForExpectations(timeout: 5, handler: nil)
    }
    
    func testProductPrice(){
        
//        let productPriceExpectation = expectation(description: "ProductsPriceExpectation")
//        //Skip 1 for default value
//        sutFailCase.productPrice.skip(1).subscribe(onNext: { value in
//            XCTAssertFalse(!value.isEmpty)
//            XCTAssertTrue(value.isEmpty)
//            XCTAssertNotNil(value)
//        }).disposed(by: disposeBag)
//
//        sutSuccessCase.productPrice.skip(1).subscribe(onNext: { value in
//            XCTAssertTrue(!value.isEmpty)
//            XCTAssertFalse(value.isEmpty)
//            XCTAssertNotNil(value)
//            XCTAssertEqual("4.45", value)
//        }).disposed(by: disposeBag)
//
//        productPriceExpectation.fulfill()
//        waitForExpectations(timeout: 5, handler: nil)
    }
    
    func testProductDescriptionTitle() {
//        let productDescriptionTitleExpectation = expectation(description: "ProductDescriptionTitleExpectation")
//        sutFailCase.productDescriptionTitle.skip(1).subscribe(onNext: { value in
//            XCTAssertTrue(!value.isEmpty)
//            XCTAssertFalse(value.isEmpty)
//            XCTAssertNotNil(value)
//        }).disposed(by: disposeBag)
//
//        sutSuccessCase.productDescriptionTitle.skip(1).subscribe(onNext: { value in
//            XCTAssertTrue(!value.isEmpty)
//            XCTAssertFalse(value.isEmpty)
//            XCTAssertNotNil(value)
//            XCTAssertEqual("", value)
//        }).disposed(by: disposeBag)
//
//        productDescriptionTitleExpectation.fulfill()
//        waitForExpectations(timeout: 5, handler: nil)
    }
    
    func testProductDescriptionLabel() {
//        let productDescriptionLabelExpectation = expectation(description: "ProductDescriptionLabelExpectation")
//        sutFailCase.productDescription.skip(1).subscribe(onNext: { value in
//            XCTAssertTrue(!value.isEmpty)
//            XCTAssertFalse(value.isEmpty)
//            XCTAssertNotNil(value)
//        }).disposed(by: disposeBag)
//
//        sutSuccessCase.productDescription.skip(1).subscribe(onNext: { value in
//            XCTAssertTrue(!value.isEmpty)
//            XCTAssertFalse(value.isEmpty)
//            XCTAssertNotNil(value)
//            XCTAssertEqual("Ocado Fairtrade Ripen at Home Bananas.\n\nBananas: Fairtrade certified and sourced from Fairtrade producers.", value)
//        }).disposed(by: disposeBag)
//
//        productDescriptionLabelExpectation.fulfill()
//        waitForExpectations(timeout: 5, handler: nil)
    }
    
    func testProductImage() {
//        let productImageExpectation = expectation(description: "ProductDescriptionLabelExpectation")
//        sutFailCase.productImage.skip(1).subscribe(onNext: { value in
//            XCTAssertNotNil(value)
//        }).disposed(by: disposeBag)
//        
//        sutSuccessCase.productImage.skip(1).subscribe(onNext: { value in
//            XCTAssertNotNil(value)
//            XCTAssertEqual(value.0, "https://mobile.ocado.com/webservices/catalogue/items/item/227255011/images/image/0/360x360.jpg")
//            XCTAssertEqual(value.1, UIImage(named: "placeHolder"))
//        }).disposed(by: disposeBag)
//        
//        productImageExpectation.fulfill()
//        waitForExpectations(timeout: 5, handler: nil)
    }
}
