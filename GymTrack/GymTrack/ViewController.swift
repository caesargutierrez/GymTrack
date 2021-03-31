//
//  ViewController.swift
//  GymTrack
//
//  Created by Caesar Gutierrez on 3/12/21.
//

import UIKit
/* Static array, before setting up data core. */
public let days = [Day(day: "monday", dow: 1),Day(day: "tuesday", dow: 2)]

class ViewController: UIViewController, UITableViewDataSource,
                      UITableViewDelegate {
    
    
    @IBOutlet weak var tableView: UITableView!
    
    /* Identifier for table view. */
    let dayViewIdentifier = "dayView"
    
    /* Number of rows. */
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return days.count
    }
    
    /* Return the formatted cells */
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: dayViewIdentifier, for: indexPath as IndexPath)
        cell.textLabel?.text = days[indexPath.row].name
        return cell
    }
    
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        performSegue(withIdentifier: "showDayID", sender: indexPath)
//    }
        
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        if segue.identifier == "showDayID",
            let dayVC = segue.destination as?
                DayViewController,
            let chosenIdx = tableView.indexPathForSelectedRow?.row
            {
                    print("changin view")
                    dayVC.delegate = self
                    dayVC.day = days[chosenIdx]
            }
    }


}

