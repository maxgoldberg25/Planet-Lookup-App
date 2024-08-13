//
//  Planet_SearcherApp.swift
//  Planet Searcher
//
//  Created by Max Goldberg on 12/10/22.
//

import SwiftUI

@main
struct Planet_SearcherApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
