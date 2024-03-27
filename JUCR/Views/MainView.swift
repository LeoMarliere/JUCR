//
//  MainContentView.swift
//  JUCR
//
//  Created by Leo Marliere on 23/03/2024.
//

import SwiftUI

struct MainView: View {
    
    @StateObject private var viewModel = MainViewModel()
    
    var body: some View {
        
        if !viewModel.isViewModelLoaded {
            ProgressView() // Show a loading indicator while fetching the view model
                .onAppear { self.viewModel.fetchMainViewModel() }
        }
        else {
            GeometryReader { geometry in
                VStack(spacing: 0) {
                    if !viewModel.isSecondViewExpanded {
                        CarStateView(viewModel: viewModel.mainModel!.car)
                            .frame(height: (geometry.size.height * 0.4))
                        InformationsView(statistiques: viewModel.mainModel!.statistiquesList, superCharges: viewModel.mainModel!.nearbyChargesList)
                            .frame(maxHeight:  .infinity)
                            .padding(.top, -50)
                    } else {
                        CarStateSmallerView(viewModel: viewModel.mainModel!.car)
                            .frame(height: (geometry.size.height * 0.2))
                        InformationsView(statistiques: viewModel.mainModel!.statistiquesList, superCharges: viewModel.mainModel!.nearbyChargesList)
                            .frame(maxHeight: .infinity)
                            .padding(.top, -50)
                        
                    }
                }
            }
            .ignoresSafeArea(.all, edges: .bottom)
            .background(MagicNumbers.customColor_mainBackground)
            .gesture(DragGesture()
                .onChanged { gesture in
                    let translation = gesture.translation.height
                    if translation < -50 {
                        withAnimation {
                            viewModel.isSecondViewExpanded = true
                        }
                    } else if translation > 50 {
                        withAnimation {
                            viewModel.isSecondViewExpanded = false
                        }
                    }
                }
            )
        }
    }
}
