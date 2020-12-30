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
    var cpy = [Days]()
    @State var daysList = [Days]()
    @State private var addDay = ""
    @State private var addType = ""
//    Setup for the navigation bar
    init(_ data: Array<Days>) {
        
        coloredNavAppearance.configureWithOpaqueBackground()
        coloredNavAppearance.backgroundColor = .systemBlue
        coloredNavAppearance.titleTextAttributes = [.foregroundColor: UIColor.black]
        coloredNavAppearance.largeTitleTextAttributes = [.foregroundColor: UIColor.black]

        UINavigationBar.appearance().standardAppearance = coloredNavAppearance
        UINavigationBar.appearance().scrollEdgeAppearance = coloredNavAppearance
        UINavigationBar.appearance().backgroundColor = .darkGray
        self.cpy = data
    }

    var body: some View {
        VStack{
//          Open DaysCards
            NavigationView {
                List(daysList) {
                    newDay in
                    NavigationLink (destination: DaysView(day: newDay))
                    {
                        DaysCard(day: newDay)
                    }
                }
                .navigationBarTitle("Choose Workout Day", displayMode: .large)
                .padding()
            }.accentColor(.black)
            
//          TODO: Organize days
            TextField("Enter new day. (ex: Monday)", text: $addDay)
                .multilineTextAlignment(.center)
            TextField("Enter type of workout day(ex: Legs).", text: $addType)
                .multilineTextAlignment(.center)

            Button(action: {
//                TODO: Add warning message when inputs are empty
                if (addType != "" && addDay != "") {
                    daysList.append((Days(day: addDay, workout: addType)))
//                    Reset vars
                    addType = ""
                    addDay = ""
                }
            },
            
            label: {
                Text("Add Day")
                    .bold()
            })
            .padding()
        }
//       View updates after loading due to @State variable, should online occur once
        .onAppear(perform: {
            self.daysList = self.cpy
        })
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let arr = [Days]()
        return ContentView(create_list(list:arr))
    }
}
