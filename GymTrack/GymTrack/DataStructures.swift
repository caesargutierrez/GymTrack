//
//  DataStructures.swift
//  GymTrack
//
//  Created by Caesar Gutierrez on 3/30/21.
//
/* Contains the data structures used through the app. */

import Foundation


public class Day {
    var name = ""
    var dayofweek: Int = 0
    var workouts: [Workout]
    
    init (day:String, dow: Int){
        self.name = day
        self.dayofweek = dow
        workouts = []
    }
    
    
}

public class Workout {
    var type = ""
    var reps = 0
    var sets = 0
}
