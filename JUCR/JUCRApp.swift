//
//  JUCRApp.swift
//  JUCR
//
//  Created by Leo Marliere on 22/03/2024.
//

import SwiftUI

@main
struct JUCRApp: App {
    
    let persistenceController = PersistenceController.shared
    
    var body: some Scene {
        WindowGroup {
            // Pass managed object context directly to ContentView
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
                .onAppear {
                    if let scene = UIApplication.shared.connectedScenes.first as? UIWindowScene {
                        let window = UIWindow(windowScene: scene)
                        let sceneFactory = MainFactory()
                        window.rootViewController = sceneFactory.createScene()
                        window.makeKeyAndVisible()
                    }
                }
        }
    }
    
}
