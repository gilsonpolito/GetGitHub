//
//  ViewController.swift
//  GetGitHub
//
//  Created by Leonardo Henrique on 14/01/16.
//  Copyright © 2016 leonardo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var searchField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
        super.touchesBegan(touches, with: event)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "userSearch"{
            let us = segue.destination as! UserViewController
            us.userSearch = searchField.text!
        } else if segue.identifier == "repositorySearch" {
            let rs = segue.destination as! RepositoryViewController
            rs.repositorySearch = searchField.text!
        }
    }

}

