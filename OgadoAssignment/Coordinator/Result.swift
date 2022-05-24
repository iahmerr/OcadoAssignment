//
//  Result.swift
//  OcadoAssignment
//
//  Created by Ahmer Hassan on 29/04/2022.
//

import Foundation

public enum ResultType<T> {
    case success(T)
    case cancel
    
    public var isCancel: Bool {
        if case ResultType.cancel = self {
            return true
        }
        return false
    }
    
    public var isSuccess: T? {
        guard !isCancel else { return nil }
        if case let ResultType.success(value) = self {
            return value
        }
        return nil
    }
}
