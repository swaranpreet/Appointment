//
//  ViewController.swift
//  Appointment
//
//  Created by Olayori Adeniran on 30/04/2024.
//  Copyright © 2024 Olayori Adeniran. All rights reserved.
//

import UIKit
import EventKit
import EventKitUI

class ViewController: UIViewController, EKEventViewDelegate {
    
    let eventStore = EKEventStore()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }


    @IBAction func addButton(_ sender: Any) {
        // let df = DateFormatter()
        eventStore.requestAccess(to: .event) { [weak self] success, error in
            if success, error == nil {
                DispatchQueue.main.async {
                    guard let store = self?.eventStore else { return }
                    let newEvent = EKEvent(eventStore: store)
                    // df.dateFormat = "MMMM dd, yyyy 'at' hh:mm:ss a 'UTC'Z"
                    newEvent.title = "Demo Event Programme"
                    newEvent.startDate = Date()
                    newEvent.endDate = Date()
                    // newEvent.calendar = Date()
                    
                    let eventController = EKEventViewController()
                    eventController.delegate = self
                    eventController.event = newEvent
                    let navigationController = UINavigationController(rootViewController: eventController)
                    self?.present(navigationController, animated: true, completion: nil)
                }
            }
        }
    }
    
    func eventViewController(_ controller: EKEventViewController, didCompleteWith action: EKEventViewAction) {
         controller.dismiss(animated: true, completion: nil)
    }
}

