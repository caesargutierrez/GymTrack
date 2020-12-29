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
//    Setup for the navigation bar
    init(_ data: Array<Days>) {
        
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
            NavigationView {
                List(daysList) {
                    newDay in
                    DaysView(day: newDay).onTapGesture {
                        print("TAPPED")
                    }
                }
                .navigationBarTitle("Choose Workout Day", displayMode: .large)
                .font(.largeTitle)
                .padding()
            }
//           Add more days.
//          TODO: Organize days
            TextField("Type New Day Here", text: $addDay)
                .multilineTextAlignment(.center)
            Button(action: {
                    daysList.append((Days(day: (addDay))))
                    print(daysList)
                
            },
            
            label: {
                Text("Add Day")
                    .bold()
            })
            .padding()
        }
//       View updates after loading due to @State variable, should online occur once
        .onAppear(perform: {
            print("ON APPEAR IS CALLED")
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
