//
//  ContentView.swift
//  JUCR
//
//  Created by Leo Marliere on 22/03/2024.
//

import SwiftUI
import CoreData

struct ContentView: View {
    
    var viewModel: MainModel?
    
    var body: some View {
           // Your SwiftUI view based on the viewModel
           Text(viewModel?.statistiquesList ?? "No Data")
       }
}

#Preview {
    ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
}
