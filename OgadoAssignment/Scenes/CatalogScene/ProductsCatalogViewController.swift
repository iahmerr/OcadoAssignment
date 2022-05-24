//
//  ViewController.swift
//  OcadoAssignment
//
//  Created by Ahmer Hassan on 28/04/2022.
//

import UIKit
import RxSwift
import RxCocoa
import RxDataSources

class ProductsCatalogViewController: UIViewController {
    
    private enum LayoutConstraintsAndConstants {
        static let headingLabelLeadingAnchor: CGFloat = 10
        static let headingLabelTrailingAnchor: CGFloat = -10
        static let tableViewTopAnchor: CGFloat = 30
        static let tableViewEstimatedRowHeight: CGFloat = 44
        static let tableViewContentInset = UIEdgeInsets(top: 0, left: 0, bottom: 40, right: 0)
    }
    
    //MARK: UIElements
    private let headingLabel = UILabelFactory.createUILabel(with: .black, textStyle: .title2, alignment: .center, lineBreakMode: .byClipping, text: "Ocado Foods and Grocery")
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.separatorStyle = .none
        tableView.estimatedRowHeight = LayoutConstraintsAndConstants.tableViewEstimatedRowHeight
        tableView.rowHeight = UITableView.automaticDimension
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.showsVerticalScrollIndicator = false
        tableView.contentInset = LayoutConstraintsAndConstants.tableViewContentInset
        tableView.delegate = self
        tableView.backgroundColor = .appBackgroundColor
        return tableView
    }()
    
    
    private var dataSource: RxTableViewSectionedReloadDataSource<SectionModel<Int, ReusableTableViewCellViewModelType>>!
    private let viewModel: ProductsCatalogViewModel
    private let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .appBackgroundColor
        setupViews()
        setupConstraints()
        bindViews()
    }
    
    init(viewModel: ProductsCatalogViewModel){
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        [tableView, headingLabel].forEach(view.addSubview)
        
        tableView.register(ProductCatalogTableViewCell.self, forCellReuseIdentifier: ProductCatalogTableViewCell.reuseIdentifier)
    }
}

extension ProductsCatalogViewController {
    
    private func setupConstraints() {
        
        NSLayoutConstraint.activate([
            headingLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            headingLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: LayoutConstraintsAndConstants.headingLabelLeadingAnchor),
            headingLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: LayoutConstraintsAndConstants.headingLabelTrailingAnchor),
            
            tableView.topAnchor.constraint(equalTo: headingLabel.bottomAnchor, constant: LayoutConstraintsAndConstants.tableViewTopAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}

extension ProductsCatalogViewController: UITableViewDelegate {
    
    private func bindViews(){
        dataSource = RxTableViewSectionedReloadDataSource(configureCell: { (val, tableView, vale, viewModel) in
            let cell = tableView.dequeueReusableCell(withIdentifier: viewModel.reusableIdentifier) as! ReusableTableViewCell
            cell.configure(with: viewModel)
            return cell
        })
        viewModel.dataSource.bind(to: tableView.rx.items(dataSource: dataSource)).disposed(by: disposeBag)
        viewModel.showLoader.subscribe(onNext: {[unowned self] showLoader in
            showLoader ? self.addAndShowActivity() : self.removeActivity()
        }).disposed(by: disposeBag)
        
        viewModel.showError.subscribe(onNext: {[unowned self] err in
            guard let err = err else { return }
            self.showError(error: err)
        }).disposed(by: disposeBag)
    }
}

