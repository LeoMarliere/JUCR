//
//  MainViewController.swift
//  JUCR
//
//  Created by Leo Marliere on 22/03/2024.
//

import SwiftUI

protocol MainViewControllerProtocol {
    func displayViewModel(viewModel: MainModel)
}

class MainViewController: UIViewController {
    
    var interactor: MainInteractorProtocol?
    private var hostingController: UIHostingController<ContentView>?
    @ObservedObject private var viewModel = MainModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        fetchInitialData()
    }
    
    private func setupUI() {
        let contentView = ContentView(viewModel: viewModel)
        hostingController = UIHostingController(rootView: contentView)
        addChild(hostingController!)
        view.addSubview(hostingController!.view)
        hostingController!.didMove(toParent: self)
    }
    
    private func fetchInitialData() {
        interactor?.fetchMainModel()
    }
}

extension MainViewController: MainViewControllerProtocol {
    
    func displayViewModel(viewModel: MainModel) {
        self.viewModel = viewModel
    }
}

