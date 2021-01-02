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
    var daysList = MainModel()    /* Create data from source. */
    init() {
        daysList.create_list()
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView().environmentObject(daysList)
        }
        
    }
}

/* Main data model. */
class MainModel: ObservableObject {
    @Published var daysList = [Days]()
    
    
    /* For development use. */
    func create_list () {
        daysList.append(Days(day: "Monday", workout: "Lower"))
        daysList.append(Days(day: "Tuesday", workout: "Upper"))
        daysList.append(Days(day: "Wednesday", workout: "Back"))
    }
    
    /* Get the array of days. */
    func get () -> Array<Days>{daysList}
    
    /* Add a new day to list. */
    func addDay(newDayName: String, newDayType: String ) { daysList.append(Days(day: newDayName, workout: newDayType)) }
}
