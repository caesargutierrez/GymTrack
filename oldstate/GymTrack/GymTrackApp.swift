//
//  GymTrackApp.swift
//  GymTrack
//
//  Created by Caesar Gutierrez on 12/20/20.
//

import SwiftUI
import CoreData

let DEV = true

@main
struct GymTrackApp: App {
    
    let persistenceController = DEV ? PersistenceController.preview :PersistenceController.shared
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
        
    }
}


