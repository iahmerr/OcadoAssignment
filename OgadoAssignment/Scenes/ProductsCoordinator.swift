//
//  ProductsCoordinator.swift
//  OcadoAssignment
//
//  Created by Ahmer Hassan on 29/04/2022.
//

import Foundation
import UIKit
import RxSwift

class ProductsCoordinator: BaseCoordinator<Result<Result<Void,NavigarionError>, NavigarionError>> {
    private let window: UIWindow
    var root: UINavigationController!
    let result = PublishSubject<Result<Result<Void, NavigarionError>, NavigarionError>>()
    
    init(window: UIWindow) {
        self.window = window
    }
    
    override func start() -> Observable<Result<Result<Void, NavigarionError>, NavigarionError>> {
        
        let viewModel = ProductsCatalogViewModel()
        let viewController = ProductsCatalogViewController(viewModel: viewModel)
        root = UINavigationControllerFactory.createTransparentNavigationBarNavigationController(rootViewController: viewController)
        window.rootViewController = root
        window.makeKeyAndVisible()
        
        viewModel.productTapped.subscribe(onNext: {[weak self] productId in
            guard let self = self else { return }
            self.navigateToDetail(productId: productId)
        }).disposed(by: disposeBag)
        
        return result
    }
    
    private func navigateToDetail(productId: Int) {
        let viewModel: ProductDetailViewModel = ProductDetailViewModel(productId: productId)
        let viewController: UIViewController = ProductDetailViewController(viewModel: viewModel)
        self.root.pushViewController(viewController, animated: true)
    }
}
