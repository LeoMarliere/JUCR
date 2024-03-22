//
//  MainFactory.swift
//  JUCR
//
//  Created by Leo Marliere on 22/03/2024.
//

import UIKit

final class MainFactory {
    
    func createScene() -> UIViewController {
        let view = MainViewController()
        let interactor = MainInteractor()
        let presenter = MainPresenter()

        presenter.view = view
        interactor.presenter = presenter
        view.interactor = interactor
        
        return view
    }
}
