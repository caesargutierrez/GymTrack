//
//  DaysView.swift
//  GymTrack
//
//  Created by Caesar Gutierrez on 12/29/20.
//

import SwiftUI

struct DaysView: View {
    var dayID: Int
    @State var showAddWork = false
    @State var exercise: String = ""
    @State var weight: String = ""
    @State var reps: String = ""
    @State var sets: String = ""
    @EnvironmentObject var data: MainModel
    
    var body: some View {
//            Title and plus sign
        VStack{
            ZStack{
                RoundedRectangle(cornerRadius: 50.0, style: .circular)
                    .fill(Color.black)
                    .frame(height: 50)
                HStack{
                    Text((data.get())[dayID].day).font(.largeTitle)
                    Image(systemName: "plus")
                        .resizable()
                        .padding(5)
                        .frame(width: 45, height: 45)
                        .clipShape(Circle())
                        .foregroundColor(.white)
                        .offset(x:50)
                        .onTapGesture {
                            showAddWork = true
                        }
                }
            }
            .foregroundColor(.white)
            .padding()
            
//          List workouts in the day
            List((data.get())[dayID].workouts) {
                workout in
                WorkOutView(workout: workout)
//                Image(systemName: "checkmark")
//                    .resizable()
//                    .padding(6)
//                    .frame(width: 24, height: 24)
//                    .background(compColor)
//                    .clipShape(Circle())
//                    .foregroundColor(.white)
//                    .onTapGesture {
//                        compColor = Color.green
//                    }
            }
//          Add a new workout
// TODO: Create function to check for valid input.
            if (showAddWork){
                VStack{
                    TextField("Exercise",text: $exercise)
                    TextField("Weight", text: $weight).keyboardType(.numberPad)
                    TextField("Reps", text: $reps).keyboardType(.numberPad)
                    TextField("Sets",text: $sets).keyboardType(.numberPad)
                    Button(action: {
                        if (exercise != ""){
                            data.daysList[dayID].addWorkout(name: exercise, weight: Int(weight)!, reps: Int(reps)!, sets: Int(sets)!)
    //                        Reset variables
                            exercise = ""
                            weight = ""
                            reps = ""
                            sets = ""
                        }
                        showAddWork = false
                    }, label: {
                        Text("Add")
                            .padding()
                            .foregroundColor(.blue)
                    })
                }
                .multilineTextAlignment(.center)
                .padding(15)
            }
        }
    }
}

struct DaysView_Previews: PreviewProvider {
    static var previews: some View {
        let data = MainModel ()
        data.create_list()
        return DaysView(dayID: 0).environmentObject(data)
    }
}

// View of each workout and its information
struct WorkOutView: View {
    
    let workout: WorkOut
    
    var body: some View {
        
        ZStack {
            RoundedRectangle(cornerRadius:50.0, style: .circular)
                .fill(Color.red)
            VStack {
                Text("\(workout.name) - \(workout.weight) lbs - \(workout.reps)/\(workout.sets) ")

            }
            .font(.system(size: 20, weight: .medium, design: .default))
            .textCase(/*@START_MENU_TOKEN@*/.uppercase/*@END_MENU_TOKEN@*/)
        }
    }
}
