//
//  AppCoordinator.swift
//  OcadoAssignment
//
//  Created by Ahmer Hassan on 29/04/2022.
//

import Foundation
import UIKit
import RxSwift

class AppCoordinator: BaseCoordinator<Result<Void,NavigarionError>> {

    private let window: UIWindow
    
    init(window: UIWindow, shortcutItem: UIApplicationShortcutItem?) {
        self.window = window
        super.init()
    }

    override func start() -> Observable<Result<Void,NavigarionError>> {
        HomeCoordinator()
        return Observable.never()
    }
}

//MARK: Navigation
private extension AppCoordinator {
    
    private func HomeCoordinator() {
        self.coordinate(to: ProductsCoordinator(window: window))
            .subscribe()
            .disposed(by: disposeBag)
    }
}

