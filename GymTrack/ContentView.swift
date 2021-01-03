//
//  ContentView.swift
//  GymTrack
//
//  Created by Caesar Gutierrez on 12/20/20.
//

import SwiftUI
//TODO: Do it so it selects the current day

let coloredNavAppearance = UINavigationBarAppearance()

struct ContentView: View {
    @EnvironmentObject var daysList: MainModel
    @State  var showAdd = false
    @State private var addDay = ""
    @State private var addType = ""

//    Setup for the navigation bar
    init() {
        
        coloredNavAppearance.configureWithOpaqueBackground()
        coloredNavAppearance.backgroundColor = .systemBlue
        coloredNavAppearance.titleTextAttributes = [.foregroundColor: UIColor.black]
        coloredNavAppearance.largeTitleTextAttributes = [.foregroundColor: UIColor.black]

        UINavigationBar.appearance().standardAppearance = coloredNavAppearance
        UINavigationBar.appearance().scrollEdgeAppearance = coloredNavAppearance
        UINavigationBar.appearance().backgroundColor = .darkGray
        
    }

    var body: some View {
        VStack{
//          Open DaysCards
            NavigationView {
                List(daysList.get()) {
                    newDay in
                    NavigationLink (destination: DaysView(day: newDay))
                    {
                        DaysCard(day: newDay)
                    }
                }
               
                .navigationBarTitle("Choose Workout Day", displayMode: .large)
                .padding()
                
            }.accentColor(.black)
            
//          Toogle button to add days.
            Button (action: { showAdd = true}, label: {
                if (!showAdd){
                    Image(systemName: "plus")
                        .resizable()
                        .padding()
                        .frame(width: 50, height: 50)
                        .background(Color.blue)
                        .clipShape(Circle())
                        .foregroundColor(.white)
                }
            })
//
            if (showAdd)
            {
                TextField("Enter new day. (ex: Monday)", text: $addDay)
                    .multilineTextAlignment(.center)
                TextField("Enter type of workout day(ex: Legs).", text: $addType)
                    .multilineTextAlignment(.center)
                
                Button(action: {
                    
    //                TODO: Add warning message when inputs are empty
                        if (addType != "" && addDay != "") {
                            daysList.addDay(newDayName: addDay, newDayType: addType)
    //                    Reset vars
                            addType = ""
                            addDay = ""
                            showAdd = false
                        }
                    },

                    label: {
                        Text("Add Day")
                            .bold()
                    })
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let daysList = MainModel()
        daysList.create_list()
        return ContentView().environmentObject(daysList)
    }
}

struct AddDayView: View {
    
    @EnvironmentObject var daysList: MainModel
    
    var body: some View {
//          TODO: Organize days
//           Adds Day , only show when on main navigation view.
        VStack{
    
            
        }
    }
}
