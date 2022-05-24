//
//  ProductsCatalogViewModel.swift
//  OcadoAssignment
//
//  Created by Ahmer Hassan on 28/04/2022.
//

import Foundation
import RxSwift
import RxDataSources

class ProductsCatalogViewModel{
    
    //MARK: inputs
    
    //MARK: outpus
    var dataSource: Observable<[SectionModel<Int, ReusableTableViewCellViewModelType>]> { return dataSourceSubject.asObservable() }
    var productTapped: Observable<Int> { productTappedSubject }
    var showLoader: Observable<Bool> { showLoaderSubject }
    var showError: Observable<AppError?> { showErrorSubject }
    
    //MARK: Subjects
    private let dataSourceSubject = BehaviorSubject<[SectionModel<Int, ReusableTableViewCellViewModelType>]>(value: [])
    private let productTappedSubject = PublishSubject<Int>()
    private let showLoaderSubject = BehaviorSubject<Bool>(value: true)
    private let showErrorSubject = BehaviorSubject<AppError?>(value: nil)
    
    private let repository: ProductsRepository
    private let disposeBag = DisposeBag()
    
    init(repository: ProductsRepository = ProductsRepository()){
        self.repository = repository
        fetchData()
    }
    
    private func fetchData() {
        showLoaderSubject.onNext(true)
         self.repository.fetchProducts {[weak self] values in
             guard let self = self else { return }
             switch values{
                 
             case .success(let result):
                 guard let result = result else { return }
                 self.createTableViewCells(products: result)
                 self.showLoaderSubject.onNext(false)
                 
             case .failure(let err):
                 print(err.localizedDescription)
                 self.showErrorSubject.onNext(err)
                 self.showLoaderSubject.onNext(false)
             }
         }
    }
}

extension ProductsCatalogViewModel {
    
    private func createTableViewCells(products: ProductsResponseModel) {
        let cellViewModels = products.clusters.map {ProductCatalogTableViewCellViewModel(cluster: $0)}
        dataSourceSubject.onNext([SectionModel(model: 0, items: cellViewModels)])
        
        let _: [()] = cellViewModels.map { $0.itemTapped }.compactMap { $0.subscribe(onNext: {[weak self] val in
            guard let self = self else { return }
            self.productTappedSubject.onNext(val)
        }).disposed(by:disposeBag)}
    }
}





