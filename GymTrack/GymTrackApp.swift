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
    var daysList: Array<Days> = [Days]()
    init() {
        //Replace this to eventually use DataCore
        daysList = create_list(list: daysList)
        print("DaysList in MAIN")
        print(daysList)
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView(daysList)
        }
        
    }
}
