//
//  DayViewController.swift
//  GymTrack
//
//  Created by Caesar Gutierrez on 3/18/21.
//

import UIKit

class DayViewController: UIViewController {
    
    
    @IBOutlet weak var workoutLabel: UILabel!
    
    
    var delegate:UIViewController!
    var day: Day!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        workoutLabel.text = day.name
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    
    
    
}
