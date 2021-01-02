//
//  DaysView.swift
//  GymTrack
//
//  Created by Caesar Gutierrez on 12/29/20.
//

import SwiftUI

struct DaysView: View {
    var day: Days
        
    var body: some View {
        VStack {
//            Title
            ZStack{
                RoundedRectangle(cornerRadius: 50.0, style: .circular)
                    .fill(/*@START_MENU_TOKEN@*/Color.blue/*@END_MENU_TOKEN@*/)
                    .frame(height: 30)
                Text(day.day).font(.title2)
            }
            HStack {
                Text("\"workoutname\"")
                Text("weight")
                Text("Reps")
            }
//            Image(systemName: "plus")
//                .resizable()
//                .padding(6)
//                .frame(width: 24, height: 24)
//                .background(Color.blue)
//                .clipShape(Circle())
//                .foregroundColor(.white)
        }.padding()
    }
}

struct DaysView_Previews: PreviewProvider {
    static var previews: some View {
        let day = Days(day: "Monday", workout: "Legs")
        DaysView(day: day)
    }
}

//struct WorkOutView: View {
//
//    var body: some View {
//
//    }
//
//}
