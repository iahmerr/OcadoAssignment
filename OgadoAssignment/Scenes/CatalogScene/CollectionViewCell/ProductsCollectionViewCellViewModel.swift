//
//  ProductsCollectionViewCellViewModel.swift
//  OcadoAssignment
//
//  Created by Ahmer Hassan on 28/04/2022.
//

import Foundation
import RxSwift
import UIKit

class ProductsCollectionViewCellViewModel: ReusableCollectionViewCellViewModelType{
    
    var reusableIdentifier: String { ProductsCollectionViewCell.reuseIdentifier }
    
    //MARK: Inputs
    
    //MARK: Outputs
    var productTitle: Observable<String> { productTitleSubject }
    var productPrice: Observable<String> { productPriceSubject }
    var productImage: Observable<ImageWithURL> { productImageSubject }
    
    //MARK: Subjects
    private let productTitleSubject = BehaviorSubject<String>(value: "")
    private let productPriceSubject = BehaviorSubject<String>(value: "")
    private let productImageSubject = BehaviorSubject<ImageWithURL>(value: ImageWithURL(nil, nil))
    
    let productId: Int
    init(item: Item){
        self.productId = item.id
        productTitleSubject.onNext(item.title)
        productPriceSubject.onNext("€ " + item.price)
        productImageSubject.onNext((item.imageURL, UIImage(named:"placeHolder")))
    }
}
