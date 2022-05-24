//
//  ProductsCollectionViewCell.swift
//  OcadoAssignment
//
//  Created by Ahmer Hassan on 28/04/2022.
//

import UIKit

class ProductsCollectionViewCell: ReusableCollectionViewCell {
    
    private enum LayoutConstraintConstants {
        static let imageViewtopAnchor: CGFloat = 10
        static let imageViewheightConstant: CGFloat = 100
        static let imageViewWidthConstant: CGFloat = 70
        static let cellViewTopAnchor: CGFloat = 5
        static let cellViewLeadingAnchor: CGFloat = 5
        static let cellViewTrailingAnchor: CGFloat = -5
        static let cellViewBottomAnchor: CGFloat = -5
        static let titleLabelTopAnchor: CGFloat = 10
        static let titleLabelLeadingAnchor: CGFloat = 5
        static let titleLabelTrailingAnchor: CGFloat = -5
        static let priceLabelTopAnchor: CGFloat = 5
        static let priceLabelLeadingAnchor: CGFloat = 5
        static let priceLabelTrailingAnchor: CGFloat = -5
        static let priceLabelBottomAnchor: CGFloat = -25
    }
    
    static let reuseIdentifier: String = "ProductsCollectionViewCell"
    private var viewModel: ProductsCollectionViewCellViewModel!
    
    private lazy var cellView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    private let imageView: UIImageView = UIImageViewFactory.createImageView(mode: .scaleAspectFit)
    private let titleLabel = UILabelFactory.createUILabel(with: .black, textStyle: .regular, alignment: .center, numberOfLines: 0)
    private let priceLabel = UILabelFactory.createUILabel(with: .black, textStyle: .micro, alignment: .center)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    override func draw(_ rect: CGRect) {
        cellView.createBorderLine()
    }
    
    private func commonInit() {
        setupViews()
        setupConstraints()
    }
    
    // MARK: Cofigurations
    
    override func configure(with viewModel: Any) {
        guard let viewModel = viewModel as? ProductsCollectionViewCellViewModel else { return }
        self.viewModel = viewModel
        bindViews(viewModel)
    }
    
    private func setupViews() {
        addSubview(cellView)
        backgroundColor = .appBackgroundColor
        [imageView, titleLabel, priceLabel].forEach(cellView.addSubview)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: cellView.topAnchor, constant: LayoutConstraintConstants.imageViewtopAnchor),
            imageView.centerXAnchor.constraint(equalTo: cellView.centerXAnchor),
            imageView.heightAnchor.constraint(equalToConstant: LayoutConstraintConstants.imageViewheightConstant),
            imageView.widthAnchor.constraint(equalToConstant: LayoutConstraintConstants.imageViewWidthConstant),
            
            cellView.topAnchor.constraint(equalTo: topAnchor, constant: LayoutConstraintConstants.cellViewTopAnchor),
            cellView.bottomAnchor.constraint(equalTo:  bottomAnchor, constant: LayoutConstraintConstants.cellViewBottomAnchor),
            cellView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: LayoutConstraintConstants.cellViewLeadingAnchor),
            cellView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: LayoutConstraintConstants.cellViewTrailingAnchor),
            
            titleLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: LayoutConstraintConstants.titleLabelTopAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: cellView.leadingAnchor, constant: LayoutConstraintConstants.titleLabelLeadingAnchor),
            titleLabel.trailingAnchor.constraint(equalTo: cellView.trailingAnchor, constant: LayoutConstraintConstants.titleLabelTrailingAnchor),
            
            priceLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: LayoutConstraintConstants.priceLabelTopAnchor),
            priceLabel.leadingAnchor.constraint(equalTo: cellView.leadingAnchor, constant: LayoutConstraintConstants.priceLabelLeadingAnchor),
            priceLabel.trailingAnchor.constraint(equalTo: cellView.trailingAnchor, constant: LayoutConstraintConstants.priceLabelTrailingAnchor),
            priceLabel.bottomAnchor.constraint(greaterThanOrEqualTo: cellView.bottomAnchor, constant: LayoutConstraintConstants.priceLabelBottomAnchor)
        ])
    }
}

extension ProductsCollectionViewCell {
    
    private func bindViews(_ viewModel: ProductsCollectionViewCellViewModel) {
        viewModel.productTitle.bind(to: titleLabel.rx.text).disposed(by: disposeBag)
        viewModel.productPrice.bind(to: priceLabel.rx.text).disposed(by: disposeBag)
        viewModel.productImage.bind(to: imageView.rx.loadImage(true)).disposed(by: disposeBag)
    }
}
