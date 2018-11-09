//
//  UserTableViewController.swift
//  GetGitHub
//
//  Created by Leonardo Henrique on 14/01/16.
//  Copyright © 2016 leonardo. All rights reserved.
//

import SwiftyJSON
import AlamofireImage
import Alamofire
import UIKit

class UserViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    
    var arrRes = [[String:AnyObject]]() //Array of dictionary
    @IBOutlet var userTableView: UITableView!
    var userSearch = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // delegate
        self.userTableView.dataSource = self
        self.userTableView.delegate = self
        getUserByLogin(user: userSearch)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        userTableView?.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.arrRes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = userTableView.dequeueReusableCell(withIdentifier: "userSearch") as! UserTableViewCell
        var dict = arrRes[indexPath.row]
        cell.loginLabel.text = dict["login"] as? String
        cell.scoreLabel.text = dict["score"]?.stringValue
        
        let img = dict["avatar_url"] as? String
        Alamofire.request(img!, method: .get).responseImage { response in
            if let image = response.result.value {
                cell.avatarImage.image = image
            }
        }
        return cell
    }
    
    func getUserByLogin(user: String) {
        Alamofire.request("https://api.github.com/search/users?", method: .get, parameters: ["q": user])
            .responseJSON { (responseData) -> Void in
                let swiftyJsonVar = JSON(responseData.result.value!)
                if let resData = swiftyJsonVar["items"].arrayObject {
                    self.arrRes = resData as! [[String:AnyObject]]
                }
                if self.arrRes.count > 0 {
                    self.userTableView.reloadData()
                }
                self.title = "\(self.arrRes.count) Usuários encontrados"
        }
    }
}
