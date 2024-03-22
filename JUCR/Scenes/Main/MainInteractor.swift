//
//  MainInteractor.swift
//  JUCR
//
//  Created by Leo Marliere on 22/03/2024.
//

import Foundation

protocol MainInteractorProtocol {
    func fetchMainModel()
}

class MainInteractor {
    
    var presenter: MainPresenterProtocol?
}

extension MainInteractor: MainInteractorProtocol {
    
    
    func fetchMainModel() {
        // Here we can simulate a Backend request to fetch the Car Data
        presenter?.presentMainModel(statData: <#T##StatistiquesData#>, chargesData: <#T##NearbySuperchargesData#>)
        
    }
    
    
    
}
