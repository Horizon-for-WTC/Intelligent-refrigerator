//
//  Intelligent_refrigeratorApp.swift
//  Intelligent refrigerator
//
//  Created by RemiliaScarlet on 2021/1/26.
//

import SwiftUI

@main
struct Intelligent_refrigeratorApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            HomepageView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
