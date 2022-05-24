//
//  RxUICollectionViewCell.swift
//  OcadoAssignment
//
//  Created by Ahmer Hassan on 28/04/2022.
//

import Foundation
import UIKit
import RxSwift

open class ReusableCollectionViewCell: UICollectionViewCell, ReusableView {
    
    private(set) public var disposeBag = DisposeBag()
    public var indexPath: IndexPath!
    
    override open func prepareForReuse() {
        super.prepareForReuse()
        disposeBag = DisposeBag()
    }
    
    open func configure(with viewModel: Any) {
        fatalError("Configure with viewModel must be implemented.")
    }
    
}
