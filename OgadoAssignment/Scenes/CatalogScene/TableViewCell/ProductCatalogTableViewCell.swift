//
//  ProductCatalogTableViewCell.swift
//  OcadoAssignment
//
//  Created by Ahmer Hassan on 28/04/2022.
//

import UIKit
import RxSwift
import RxCocoa
import RxDataSources

class ProductCatalogTableViewCell: ReusableTableViewCell {
    
    private enum LayoutConstraintConstants {
        static let collectionViewContentInset = UIEdgeInsets(top: 0, left: 15, bottom: 0, right: 20)
        static let headerLabelTopAnchor: CGFloat = 20
        static let headerLabelLeadingAnchor: CGFloat = 30
        static let collectionViewTopAnchor: CGFloat = 20
        static let collectionViewBottomAnchor: CGFloat = -10
        static let collectionViewHeightAnchor: CGFloat = 220
        static let collectionViewCellSize = CGSize(width: 170, height: 220)
        static let collectionViewMinimumLineSpacing: CGFloat = 14
    }
    
    static let reuseIdentifier = "ProductCatalogTableViewCell"

    private var viewModel: ProductCatalogTableViewCellViewModel!
    private var dataSource: RxCollectionViewSectionedReloadDataSource<SectionModel<Int, ReusableCollectionViewCellViewModelType>>!
    
    private let headerLabel = UILabelFactory.createUILabel(with: .greyDark, textStyle: .large, alignment: .left, numberOfLines: 0, adjustFontSize: true)
    
    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.delegate = self
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.contentInset = LayoutConstraintConstants.collectionViewContentInset
        collectionView.backgroundColor = .appBackgroundColor
        return collectionView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        selectionStyle = .none
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func configure(with viewModel: Any) {
        guard let viewModel = viewModel as? ProductCatalogTableViewCellViewModel else { return }
        self.viewModel = viewModel
        setupViews()
        setupConstraints()
        bindViews()
        self.contentView.isUserInteractionEnabled = false
    }
}

extension ProductCatalogTableViewCell {
    
    private func setupViews(){
        [headerLabel,collectionView].forEach(addSubview)
        backgroundColor = .appBackgroundColor
        collectionView.register(ProductsCollectionViewCell.self, forCellWithReuseIdentifier: ProductsCollectionViewCell.reuseIdentifier)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            headerLabel.topAnchor.constraint(equalTo: topAnchor, constant: LayoutConstraintConstants.headerLabelTopAnchor),
            headerLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: LayoutConstraintConstants.headerLabelLeadingAnchor),
            headerLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            
            collectionView.topAnchor.constraint(equalTo: headerLabel.bottomAnchor, constant: LayoutConstraintConstants.collectionViewTopAnchor),
            collectionView.leadingAnchor.constraint(equalTo: leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: LayoutConstraintConstants.collectionViewBottomAnchor),
            collectionView.heightAnchor.constraint(equalToConstant: LayoutConstraintConstants.collectionViewHeightAnchor)
        ])
    }
    
    private func bindViews() {
        
        viewModel.clusterHeaderTitle.bind(to: headerLabel.rx.text).disposed(by: disposeBag)
        
        dataSource = RxCollectionViewSectionedReloadDataSource(configureCell: { (_, collectionView, indexPath, viewModel) in
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: viewModel.reusableIdentifier, for: indexPath) as! ReusableCollectionViewCell
            cell.configure(with: viewModel)
            return cell
        })
        viewModel.dataSource.bind(to: collectionView.rx.items(dataSource: dataSource)).disposed(by: disposeBag)
        
        collectionView.rx.modelSelected(ProductsCollectionViewCellViewModel.self).subscribe(on: MainScheduler.instance).map {$0.productId}.bind(to: viewModel.itemTapObserver).disposed(by: disposeBag)
    }
}

extension ProductCatalogTableViewCell: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return LayoutConstraintConstants.collectionViewCellSize
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return LayoutConstraintConstants.collectionViewMinimumLineSpacing
    }
}
