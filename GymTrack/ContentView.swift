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
        
    var daysList = [Days]()
    init() {
//        Replace this to eventually use DataCore
        daysList = create_list(list: daysList)
        
        coloredNavAppearance.configureWithOpaqueBackground()
        coloredNavAppearance.backgroundColor = .systemBlue
        coloredNavAppearance.titleTextAttributes = [.foregroundColor: UIColor.black]
        coloredNavAppearance.largeTitleTextAttributes = [.foregroundColor: UIColor.black]

        UINavigationBar.appearance().standardAppearance = coloredNavAppearance
        UINavigationBar.appearance().scrollEdgeAppearance = coloredNavAppearance
        UINavigationBar.appearance().backgroundColor = .darkGray
        
    }

    var body: some View {
        
        print("Printing elementes: ")
        for elem in daysList{
            print(elem.day)
            print(elem.id)
        }
//        Main view here
        return NavigationView {
            List(daysList) {
                newDay in
                DaysView(day: newDay)
            }
            .navigationBarTitle("Choose Workout Day", displayMode: .inline)
            .font(.largeTitle)
            .padding()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

/* Configures background color for nagivation window. */
//struct NavigationConfigurator: UIViewControllerRepresentable {
//    var configure: (UINavigationController) -> Void = { _ in }
//
//    func makeUIViewController(context: UIViewControllerRepresentableContext<NavigationConfigurator>) -> UIViewController {
//        return UIViewController()
//    }
//    func updateUIViewController(_ uiViewController: UIViewController, context: UIViewControllerRepresentableContext<NavigationConfigurator>) {
//        if let nc = uiViewController.navigationController {
//            self.configure(nc)
//        }
//    }

//}
