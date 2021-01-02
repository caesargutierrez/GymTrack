//
//  DaysView.swift
//  GymTrack
//
//  Created by Caesar Gutierrez on 12/21/20.
//

import SwiftUI

//VIEW: View for a Day, shows Day name, workout type, and number of workouts for that day
struct DaysCard: View {
    
    var day: Days
    
    var body: some View {
        ZStack {
            // Card background
            RoundedRectangle(cornerRadius: 20, style: /*@START_MENU_TOKEN@*/.continuous/*@END_MENU_TOKEN@*/)
                .fill(Color.blue)
            RoundedRectangle(cornerRadius: 20, style: /*@START_MENU_TOKEN@*/.continuous/*@END_MENU_TOKEN@*/)
                .stroke(lineWidth: 3)
            //Contents workout
            VStack (content: {
                Text(day.day).bold()
                Text("Workout Type: ").underline() + Text(day.workout)
                Text("Number of Workouts: ").underline() + Text(String(day.numOfWorkouts))
                Spacer()
            }).font(.title)
        }
    }
}

struct DaysCard_Previews: PreviewProvider {
    static var previews: some View {
        DaysCard(day: Days(day:"Sunday",workout: "Arms"))
    }
}

// MODEL
var daysleft = 0
/* Data structure to represent the day of the week */
struct Days: Identifiable {
    
    let day: String
    let workout: String
    let numOfWorkouts = 0
    let id: Int
    
    init(day: String, workout: String) {
        self.day = day
        self.workout = workout
        self.id = daysleft
//      Everytime a new day gets added we reduce our count
        daysleft += 1
    }
    
}


