//
//  MainConfigurator.swift
//  JUCR
//
//  Created by Leo Marliere on 22/03/2024.
//

import Foundation

protocol MainConfiguratorProtocol {
    func configured(_ vc: MainViewController) -> MainViewController
}

final class MainConfigurator: MainConfiguratorProtocol {
    
    private var sceneFactory: MainFactoryProtocol
    
    init(sceneFactory: MainFactoryProtocol) {
        self.sceneFactory = sceneFactory
    }
    
    @discardableResult
    func configured(_ vc: MainViewController) -> MainViewController {
        sceneFactory.configurator = self
        
        let interactor = MainInteractor()
        let presenter = MainPresenter()

        presenter.view = vc
        interactor.presenter = presenter
        vc.interactor = interactor
        
        return vc
    }
}
