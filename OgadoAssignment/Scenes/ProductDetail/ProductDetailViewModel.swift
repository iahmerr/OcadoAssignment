//
//  ProductDetailViewModel.swift
//  OcadoAssignment
//
//  Created by Ahmer Hassan on 29/04/2022.
//

import Foundation
import RxSwift
import UIKit


class ProductDetailViewModel {
    
    //MARK: Inputs
    
    //MARK: Outputs
    var productName: Observable<String> { productNameSubject }
    var productPrice: Observable<String> { productPriceSubject }
    var productIngredients: Observable<String> { productIngredientsSubject }
    var productId: Observable<String> { productIdSubject }
    var productDescriptionTitle: Observable<String> {productDescripTitleSubject }
    var productDescription: Observable<String> {productDescriptionSubject }
    var productImage: Observable<ImageWithURL> { productImageSubject }
    var showError: Observable<AppError?> { showErrorSubject }
    var showLoader: Observable<Bool> { showLoaderSubject }
    
    //MARK: Subjects
    private let productNameSubject = BehaviorSubject<String>(value: "")
    private let productPriceSubject = BehaviorSubject<String>(value: "")
    private let productIngredientsSubject = BehaviorSubject<String>(value: "")
    private let productIdSubject = BehaviorSubject<String>(value: "")
    private let productDescripTitleSubject = BehaviorSubject<String>(value: "")
    private let productDescriptionSubject = BehaviorSubject<String>(value: "")
    private let productImageSubject = BehaviorSubject<ImageWithURL>(value: ImageWithURL(nil, nil))
    private let showErrorSubject = BehaviorSubject<AppError?>(value: nil)
    private let showLoaderSubject = BehaviorSubject<Bool>(value: true)
    
    private let repository: ProductsRepository
    init(repository: ProductsRepository = ProductsRepository(), productId: Int) {
        self.repository = repository
        fetchProductDetail(for: productId)
    }
    
    private func fetchProductDetail(for productId: Int){
        showLoaderSubject.onNext(true)
        self.repository.fetchProductDetail(productId: productId) {[weak self] values in
            guard let self = self else { return }
            switch values{
            case .success(let item):
                guard let item = item else { return }
                self.bindData(item: item)
                self.showLoaderSubject.onNext(false)
            case .failure(let err):
                print(err.localizedDescription)
                self.showErrorSubject.onNext(err)
                self.showLoaderSubject.onNext(false)
            }
        }
    }
    
    private func bindData(item: ProductsDetailsModel) {
        productNameSubject.onNext(item.title)
        productPriceSubject.onNext("€ " + item.price)
        productIngredientsSubject.onNext("Allergy Info: " + item.allergyInformation)
        productIdSubject.onNext("Product Id: \(item.id)")
        productDescripTitleSubject.onNext("Product Description")
        productDescriptionSubject.onNext(item.description)
        productImageSubject.onNext((item.imageURL, UIImage(named: "placeHolder")))
    }
}
