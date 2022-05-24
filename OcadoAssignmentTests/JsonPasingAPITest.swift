//
//  JsonPasingProductsAPITest.swift
//  OcadoAssignmentTests
//
//  Created by Ahmer Hassan on 02/05/2022.
//

import XCTest
@testable import OcadoAssignment

//MARK: Json Parse Test

class JsonPasingAPITest: XCTestCase {
    
    func testJsonParsingForProductsAPI(){
        guard let pathString = Bundle(for: type(of: self)).path(forResource: "ProductJsonResponse", ofType: "json") else {
            fatalError("File not found")
        }
        
        guard let json = try? String(contentsOfFile: pathString, encoding: .utf8) else {
            fatalError("Unable to convert to json")
        }
        
        let jsonData = json.data(using: .utf8)!
        let decodedResult = try! JSONDecoder().decode(ProductsResponseModel.self, from: jsonData)
        
        XCTAssertNotNil(jsonData)
        XCTAssertNotNil(decodedResult)
        XCTAssertEqual(decodedResult.clusters[0].tag, "Bananas")
        XCTAssertEqual(decodedResult.clusters[1].tag, "Sugar & Home Baking")
        XCTAssertFalse(decodedResult.clusters.isEmpty)
        XCTAssertEqual(2, decodedResult.clusters[0].items.count)
        XCTAssertEqual(3, decodedResult.clusters[1].items.count)
    }
    
    func testJsonParsingForProductDetail(){
        guard let pathString = Bundle(for: type(of: self)).path(forResource: "ProductsDetailResponse", ofType: "json") else {
            fatalError("File not found")
        }
        
        guard let json = try? String(contentsOfFile: pathString, encoding: .utf8) else {
            fatalError("Unable to convert to json")
        }
        
        let jsonData = json.data(using: .utf8)!
        let decodedResult = try! JSONDecoder().decode(ProductsDetailsModel.self, from: jsonData)
        XCTAssertNotNil(jsonData)
        XCTAssertNotNil(decodedResult)
        XCTAssertEqual(decodedResult.title, "Ocado Sunflower Seeds")
        XCTAssertEqual(decodedResult.price, "0.90")
        XCTAssertEqual(decodedResult.id, 386138011)
        XCTAssertEqual("https://mobile.ocado.com/webservices/catalogue/items/item/386138011/images/image/0/240x240.jpg", decodedResult.imageURL)
        XCTAssertEqual("May contain traces of nuts and sesame seeds.", decodedResult.allergyInformation)
    }
}
