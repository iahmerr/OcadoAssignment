//
//  ProductCatalogTableViewCellViewModel.swift
//  OcadoAssignment
//
//  Created by Ahmer Hassan on 28/04/2022.
//

import Foundation
import RxSwift
import RxDataSources

class ProductCatalogTableViewCellViewModel: ReusableTableViewCellViewModelType{
    var reusableIdentifier: String { ProductCatalogTableViewCell.reuseIdentifier }
    
    //MARK: inputs
    var itemTapObserver: AnyObserver<Int> { itemTapSubject.asObserver() }
    
    //MARK: outputs
    var dataSource: Observable<[SectionModel<Int, ReusableCollectionViewCellViewModelType>]> { dataSourceSubject }
    var clusterHeaderTitle: Observable<String> { clusterHeaderTitleSubject }
    var itemTapped: Observable<Int> { itemTapSubject }
    
    //MARK: Subjects
    private let dataSourceSubject = BehaviorSubject<[SectionModel<Int, ReusableCollectionViewCellViewModelType>]>(value: [])
    private let clusterHeaderTitleSubject = BehaviorSubject<String>(value: "")
    private let itemTapSubject = PublishSubject<Int>()
    
    private let disposeBag = DisposeBag()
    init(cluster: Cluster) {
        clusterHeaderTitleSubject.onNext(cluster.tag)
        
        let cellViewModels = cluster.items.map {ProductsCollectionViewCellViewModel(item: $0)}
        dataSourceSubject.onNext([SectionModel(model: 0, items: cellViewModels)])
    }
}
