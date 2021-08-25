//
//  ViewController.swift
//  ExploringEventKit
//
//  Created by USER on 24/08/2021.
//
import EventKitUI
import EventKit
import UIKit

class ViewController: UIViewController,EKEventViewDelegate {
  
    let store = EKEventStore()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(didTapAdd))
    }
    @objc func didTapAdd(){
        
        
        
        store.requestAccess(to: .event){[weak self]success,error in
            if success,error == nil{
                DispatchQueue.main.async {
                    guard let store = self?.store else { return }
                    let newEvent = EKEvent(eventStore: store)
                    newEvent.title = "Events YouTube Video"
                    newEvent.startDate = Date()
                    newEvent.endDate = Date()
                    
                    
                    let otherVC = EKEventEditViewController()
                    otherVC.eventStore = store
                    otherVC.event = newEvent
                    self?.present(otherVC,
                                  animated: true,
                                   completion: nil)
                    
                    
   //                 let vc = EKEventViewController()
     //               vc.delegate = self
      //              vc.event = newEvent
        //            let navVC = UINavigationController(rootViewController: vc)
         //           self?.present(navVC, animated: true)
                }
            }
        }
    }
    func eventViewController(_ controller: EKEventViewController, didCompleteWith action: EKEventViewAction) {
        controller.dismiss(animated: true, completion: nil)
    }
}

