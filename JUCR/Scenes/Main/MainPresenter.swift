//
//  MainPresenter.swift
//  JUCR
//
//  Created by Leo Marliere on 22/03/2024.
//

import Foundation

protocol MainPresenterProtocol {
    func presentMainModel(statData: StatistiquesData, chargesData: SuperchargesData)
}

class MainPresenter {
    
    var view: MainViewControllerProtocol?
    
}

extension MainPresenter: MainPresenterProtocol {
    
    func presentMainModel(statData: StatistiquesData, chargesData: SuperchargesData) {
        //let statistiques = Statistiques(from: statData)
        //let nearbyCharges = NearbySupercharges(from: chargesData)
        let mainViewModel = MainModel(statistiquesList: [], nearbyChargesList: [])
        view?.displayViewModel(viewModel: mainViewModel)
        
    }
    
    
}
