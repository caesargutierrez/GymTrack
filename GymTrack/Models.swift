//
//  Models.swift
//  GymTrack
//  Models for all the structs and classes used through out the app
//  Created by Caesar Gutierrez on 1/3/21.
//

import Foundation

/* Main data model. */
class MainModel: ObservableObject {
    @Published var daysList = [Days]()
    var daysIdx = 0
    
    
    /* For development use. */
    func create_list () {
        daysList.append(Days(day: "Monday", workout: "Lower",id: daysIdx))
        daysList[0].addWorkout(name: "Squats", weight: 150, reps: 12, sets: 4)
        daysList[0].addWorkout(name: "LegPress", weight: 400, reps: 12, sets: 4)
        daysIdx+=1
        daysList.append(Days(day: "Tuesday", workout: "Upper",id: daysIdx))
        daysIdx+=1
        daysList.append(Days(day: "Wednesday", workout: "Back",id: daysIdx))
        daysIdx+=1
    }
    
    /* Get the array of days. */
    func get () -> Array<Days>{daysList}
    
    /* Add a new day to list. */
    func addDay(newDayName: String, newDayType: String ) {
        daysList.append(Days(day: newDayName, workout: newDayType,id: daysIdx))
        daysIdx+=1
    }
}

// MODEL
/* Data structure to represent the day of the week */
struct Days: Identifiable {
    
    let day: String
    let workoutType: String
    var numOfWorkouts = 0
    let id: Int
    var workouts: Array<WorkOut>
    
    init(day: String, workout: String, id: Int ) {
        self.day = day
        self.workoutType = workout
        self.id = id
        self.workouts = [WorkOut]()
    }
    /* Add a new workout to the day */
    mutating func addWorkout (name: String, weight: Int, reps: Int, sets: Int){
        numOfWorkouts+=1
        workouts.append(WorkOut(name: name, weight: weight, reps: reps, sets: sets, id: numOfWorkouts))
    }
    
}

// Model for each workout
struct WorkOut: Identifiable {
    var name: String
    var weight: Int
    var reps: Int
    var sets: Int
    var id: Int
}
