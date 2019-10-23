//
//  ViewController.swift
//  NetworkConnection
//
//  Created by logesh on 2/10/19.
//  Copyright © 2019 logesh. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet var networkLabel: UILabel!
    let networkRechablity = Reachability()!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NotificationCenter.default.addObserver(self, selector: #selector(internetChanged), name: Notification.Name.reachabilityChanged, object: networkRechablity)
        do
        {
            try networkRechablity.startNotifier()
        }
        catch
        {
            print("could not start notifier")
        }
    }

    @objc func internetChanged(note:Notification)
    {
        let reachability = note.object as! Reachability
        if reachability.connection != .none
        {
            if reachability.connection == .wifi
            {
                DispatchQueue.main.async {
                   self.networkLabel.text = "Connected using Wifi"
                }
            }
            else
            {
                DispatchQueue.main.async {
                   self.networkLabel.text = "Connected using Cellular"
                }
            }
        }
        else
        {
            DispatchQueue.main.async {
               self.networkLabel.text = "No Internet Connection"
            }
        }
    }

}

