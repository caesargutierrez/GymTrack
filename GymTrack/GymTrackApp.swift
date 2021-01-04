//
//  GymTrackApp.swift
//  GymTrack
//
//  Created by Caesar Gutierrez on 12/20/20.
//

import SwiftUI

@main
struct GymTrackApp: App {
//    TODO: Use data core and create array from there.
    var data = MainModel()    /* Create data from source. */
    init() {
        data.create_list()
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView().environmentObject(data)
        }
        
    }
}
