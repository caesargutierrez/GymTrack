//
//  DaysView.swift
//  GymTrack
//
//  Created by Caesar Gutierrez on 12/21/20.
//

import SwiftUI

struct DaysView: View {
    
    var day: Days
    
    var body: some View {
        ZStack {
            // Card background
            RoundedRectangle(cornerRadius: 20, style: /*@START_MENU_TOKEN@*/.continuous/*@END_MENU_TOKEN@*/)
                .fill(Color.blue)
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

struct DaysView_Previews: PreviewProvider {
    static var previews: some View {
        DaysView(day: Days(day:"Sunday"))
    }
}

var daysleft = 5
/* Data structure to represent the day of the week */
struct Days: Identifiable {
    
    let day: String
    let workout: String
    let numOfWorkouts = 0
    let id: Int
    
    init(day: String) {
        self.day = day
        self.workout = "Lower"
        self.id = daysleft
//      Everytime a new day gets added we reduce our count
        daysleft -= 1
    }
    
}

//struct DayViewList (){
//
//}

/* For development use. */
func create_list (list: Array<Days>) -> Array<Days>{
    var list = list
    list.append(Days(day: "Monday"))
    list.append(Days(day: "Tuesday"))
    list.append(Days(day: "Wednesday"))
    return list
}
