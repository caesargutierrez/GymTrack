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
    @EnvironmentObject var data: MainModel
    @State  var showAdd = false
    @State private var addDay = ""
    @State private var addType = ""
    @State private var buttonMessage = ""

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
                List(data.get()) {
                    newDay in
                    NavigationLink (destination: DaysView(dayID: newDay.id).environmentObject(data))
                    {
                        DaysCard(day: newDay)
                    }
                }
               
                .navigationBarTitle("Choose Workout Day", displayMode: .large)
                .padding()
                
            }.accentColor(.black)
            
//          Toogle button to add days.
            Button (action: {
                showAdd = true
                buttonMessage = "Dismiss"
                
            }, label: {
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
                    .onTapGesture {
                        if (addDay != "")
                        {
                            buttonMessage = "Add Day"
                        }
                    }
                
                Button(action: {
                    
//                TODO: Add warning message when inputs are empty
                    if (addType != "" && addDay != "") {
                        data.addDay(newDayName: addDay, newDayType: addType)
                        
                    }
//                  Reset vars
                    showAdd = false
                    addType = ""
                    addDay = ""
                    buttonMessage = "Dismiss"

                    },

                    label: {
                        Text(buttonMessage)
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

