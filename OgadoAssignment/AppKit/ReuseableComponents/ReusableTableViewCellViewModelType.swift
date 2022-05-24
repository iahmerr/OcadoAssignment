//
//  ReusableTableViewCellViewModelType.swift
//  OcadoAssignment
//
//  Created by Ahmer Hassan on 28/04/2022.
//

import Foundation

public protocol ReusableTableViewCellViewModelType {
    var reusableIdentifier: String { get }
}

public protocol ReusableCollectionViewCellViewModelType {
    var reusableIdentifier: String { get }
}
