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
        Text(day.day)
    }
}

struct DaysView_Previews: PreviewProvider {
    static var previews: some View {
        let day = Days(day: "Monday", workout: "Legs")
        DaysView(day: day)
    }
}
