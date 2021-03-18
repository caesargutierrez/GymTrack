//
//  ViewController.swift
//  GymTrack
//
//  Created by Caesar Gutierrez on 3/12/21.
//

import UIKit

public let days = ["Monday","Tuesday"]

class ViewController: UIViewController, UITableViewDataSource,
                      UITableViewDelegate {
    
    
    @IBOutlet weak var tableView: UITableView!
    
    let dayViewIdentifier = "dayView"
    
    /* Number of rows. */
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return days.count
    }
    
    /* Return the formatted cells */
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: dayViewIdentifier, for: indexPath as IndexPath)
        cell.textLabel?.text = days[indexPath.row]
        return cell
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableView.delegate = self
        tableView.dataSource = self
    }


}

