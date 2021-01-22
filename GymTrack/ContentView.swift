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
    @State var showAddButton = true
    @State private var addDay = ""
    @State private var addType = ""
    @State private var buttonMessage = ""

//    Setup for the navigation bar
    init() {
        coloredNavAppearance.configureWithOpaqueBackground()
        coloredNavAppearance.backgroundColor = .black
        coloredNavAppearance.titleTextAttributes = [.foregroundColor: UIColor.white]
        coloredNavAppearance.largeTitleTextAttributes = [.foregroundColor: UIColor.white]

        UINavigationBar.appearance().standardAppearance = coloredNavAppearance
        UINavigationBar.appearance().scrollEdgeAppearance = coloredNavAppearance
        UINavigationBar.appearance().backgroundColor = .black
        
    }

    var body: some View {
        VStack{
//          Open DaysCards
            NavigationView {
                List(data.get()) {
                    newDay in
                    NavigationLink (destination: DaysView(dayID: newDay.id)
                                        .environmentObject(data)
                                        .onAppear {
                                            showAddButton = false
                                        }
                                        .onDisappear {
                                            showAddButton = true
                                        })
                    {
                        DaysCard(day: newDay)

                    }
                }
               
                .navigationBarTitle("Choose Workout Day", displayMode: .large)
                .padding()
                
            }.accentColor(.white) /* Fixes navigationlink back button color. */
            if(showAddButton) {
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
                            .background(Color.black)
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
//                            TODO: synchronize the input button better
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
    }  // end of var body
    
    // TODO: might have to delete these later
    private func addItem() {
        withAnimation {
            let newItem = Item(context: viewContext)
            newItem.timestamp = Date()

            do {
                try viewContext.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        }
    }

    private func deleteItems(offsets: IndexSet) {
        withAnimation {
            offsets.map { items[$0] }.forEach(viewContext.delete)

            do {
                try viewContext.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
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

