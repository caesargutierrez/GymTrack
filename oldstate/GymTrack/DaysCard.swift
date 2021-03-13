//
//  DaysView.swift
//  GymTrack
//
//  Created by Caesar Gutierrez on 12/21/20.
//

import SwiftUI

//VIEW: View for a Day, shows Day name, workout type, and number of workouts for that day
struct DaysCard: View {
    @EnvironmentObject var data: MainModel
    var day: Days
    var body: some View {
        ZStack {
            // Card background
            RoundedRectangle(cornerRadius: 20, style: /*@START_MENU_TOKEN@*/.continuous/*@END_MENU_TOKEN@*/)
                .fill(Color.black)
            RoundedRectangle(cornerRadius: 20, style: /*@START_MENU_TOKEN@*/.continuous/*@END_MENU_TOKEN@*/)
                .stroke(lineWidth: 3)
            //Contents workout
            VStack (content: {
                Text(day.day).bold()
                Text("Workout Type: ").underline() + Text(day.workoutType)
                Text("Number of Workouts: ").underline() + Text(String(day.numOfWorkouts))
                Spacer()
            })
            .font(.title)
            .foregroundColor(.white)
            
        }
    }
}

struct DaysCard_Previews: PreviewProvider {
    static var previews: some View {
        DaysCard(day: Days(day:"Sunday",workout: "Arms",id: 0))
    }
}
