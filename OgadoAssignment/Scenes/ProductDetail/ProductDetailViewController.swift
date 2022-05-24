//
//  ProductDetailViewController.swift
//  OcadoAssignment
//
//  Created by Ahmer Hassan on 29/04/2022.
//

import UIKit
import RxSwift

class ProductDetailViewController: UIViewController {
    
    private enum LayoutContraintsAndConstants {
        static let titleLabelTopAnchor: CGFloat = 15
        static let titleLabelLeadingAnchor: CGFloat = 30
        static let titleLabelTrailingAnchor: CGFloat = -30
        static let titleLabelHeightConstant: CGFloat = 50
        static let productImageTopAnchor: CGFloat = 30
        static let productImageLeadingAnchor: CGFloat = 30
        static let productImageTrailingAnchor: CGFloat = -30
        static let productImageHeightMultiplier: CGFloat = 0.35
        static let priceAndDetailStackTopAnchor: CGFloat = 30
        static let priceAndDetailStackLeadingAnchor: CGFloat = 30
        static let priceAndDetailStackTrailingAnchor: CGFloat = -30
        static let priceAndDetailStackHeightConstant: CGFloat = 100
        static let descriptionStackTopAnchor: CGFloat = 40
        static let descriptionStackLeadingAnchor: CGFloat = 30
        static let descriptionStackTrailingAnchor: CGFloat = -30
        static let descriptionStackBottomAnchor: CGFloat = -10
    }
    
    //MARK: UIElements
    private lazy var titleLabel: UILabel = UILabelFactory.createUILabel(with: .black, textStyle: .title3, alignment: .center, numberOfLines: 0, adjustFontSize: true)
    private lazy var priceLabel: UILabel = UILabelFactory.createUILabel(with: .greyDark, textStyle: .title3, alignment: .center)
    private lazy var productImage: UIImageView = UIImageViewFactory.createImageView(mode: .scaleAspectFit)
    private lazy var productNumberLabel: UILabel = UILabelFactory.createUILabel(with: .black, textStyle: .small, alignment: .center)
    private lazy var ingredientsLabel: UILabel = UILabelFactory.createUILabel(with: .black, textStyle: .small, alignment: .center, numberOfLines: 0, adjustFontSize: true)
    private lazy var descriptionTitleLabel: UILabel = UILabelFactory.createUILabel(with: .greyDark, textStyle: .title3, alignment: .center)
    private lazy var descriptionDetailLabel: UILabel = UILabelFactory.createUILabel(with: .greyDark, textStyle: .small, alignment: .center, numberOfLines: 0, adjustFontSize: true)
    
    private lazy var priceAndDetailStack = UIStackViewFactory.createStackView(with: .vertical, alignment: .center, distribution: .fillEqually, spacing: 5)
    private lazy var descriptionStack = UIStackViewFactory.createStackView(with: .vertical, alignment: .center, distribution: .fill, spacing: 10)
    
    private let disposeBag = DisposeBag()
    private var viewModel: ProductDetailViewModel
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .appBackgroundColor
        
        setupViews()
        setupConstraints()
        bindViews()
    }
    
    override func viewWillLayoutSubviews() {
        productImage.createBorderLine()
    }
    
    init(viewModel: ProductDetailViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        [priceAndDetailStack, productImage, titleLabel,descriptionStack].forEach(view.addSubview)
        [productNumberLabel, priceLabel, ingredientsLabel].forEach(priceAndDetailStack.addArrangedSubview)
        [descriptionTitleLabel, descriptionDetailLabel].forEach(descriptionStack.addArrangedSubview)
    }
    
    private func setupConstraints(){
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: LayoutContraintsAndConstants.titleLabelTopAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: LayoutContraintsAndConstants.titleLabelLeadingAnchor),
            titleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: LayoutContraintsAndConstants.titleLabelTrailingAnchor),
            titleLabel.heightAnchor.constraint(equalToConstant: LayoutContraintsAndConstants.titleLabelHeightConstant),
            
            productImage.topAnchor.constraint(equalTo: titleLabel.bottomAnchor , constant: LayoutContraintsAndConstants.productImageTopAnchor),
            productImage.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: LayoutContraintsAndConstants.productImageLeadingAnchor),
            productImage.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: LayoutContraintsAndConstants.productImageTrailingAnchor),
            productImage.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: LayoutContraintsAndConstants.productImageHeightMultiplier),
            
            priceAndDetailStack.topAnchor.constraint(equalTo: productImage.bottomAnchor, constant: LayoutContraintsAndConstants.priceAndDetailStackTopAnchor),
            priceAndDetailStack.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: LayoutContraintsAndConstants.priceAndDetailStackTopAnchor),
            priceAndDetailStack.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: LayoutContraintsAndConstants.priceAndDetailStackTrailingAnchor),
            priceAndDetailStack.heightAnchor.constraint(equalToConstant: LayoutContraintsAndConstants.priceAndDetailStackHeightConstant),
            
            descriptionStack.topAnchor.constraint(equalTo: priceAndDetailStack.bottomAnchor, constant: LayoutContraintsAndConstants.descriptionStackTopAnchor),
            descriptionStack.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: LayoutContraintsAndConstants.descriptionStackLeadingAnchor),
            descriptionStack.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: LayoutContraintsAndConstants.descriptionStackTrailingAnchor),
            descriptionStack.bottomAnchor.constraint(lessThanOrEqualTo: view.safeAreaLayoutGuide.bottomAnchor, constant: LayoutContraintsAndConstants.descriptionStackBottomAnchor)
        ])
    }
    
}

extension ProductDetailViewController {
    
    private func bindViews() {
       
        viewModel.productName.bind(to: titleLabel.rx.text).disposed(by: disposeBag)
        viewModel.productImage.bind(to: productImage.rx.loadImage(true)).disposed(by: disposeBag)
        viewModel.productPrice.bind(to: priceLabel.rx.text).disposed(by: disposeBag)
        viewModel.productId.bind(to: productNumberLabel.rx.text).disposed(by: disposeBag)
        viewModel.productIngredients.bind(to: ingredientsLabel.rx.text).disposed(by: disposeBag)
        viewModel.productDescription.bind(to: descriptionDetailLabel.rx.text).disposed(by: disposeBag)
        viewModel.productDescriptionTitle.bind(to: descriptionTitleLabel.rx.text).disposed(by: disposeBag)
        
        viewModel.showLoader.subscribe(onNext: {[unowned self] showLoader in
            showLoader ? self.addAndShowActivity() : self.removeActivity()
        }).disposed(by: disposeBag)
        
        viewModel.showError.subscribe(onNext: {[unowned self] err in
            guard let err = err else { return }
            self.showError(error: err)
        }).disposed(by: disposeBag)
    }
}
