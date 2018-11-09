//
//  RepositoryTableViewController.swift
//  GetGitHub
//
//  Created by Leonardo Henrique on 14/01/16.
//  Copyright © 2016 leonardo. All rights reserved.
//

import Alamofire
import UIKit
import SwiftyJSON
import AlamofireImage

class RepositoryViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var arrRes = [[String:AnyObject]]() //Array of dictionary
    @IBOutlet var repositoryTableView: UITableView!
    var repositorySearch: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // delegate
        self.repositoryTableView.dataSource = self
        self.repositoryTableView.delegate = self
        // service using Alamofire lybrary
        getRepositoryByName(repository: repositorySearch)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    private func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: IndexPath) {
        repositoryTableView?.deselectRow(at: indexPath as IndexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.arrRes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = repositoryTableView.dequeueReusableCell(withIdentifier: "repositorySearch") as! RepositoryTableViewCell
        var dict = arrRes[indexPath.row]
        cell.repositoryName.text = dict["full_name"] as? String
        cell.qtdeForks.text = dict["forks_count"]?.stringValue
        cell.qtdeStars.text = dict["stargazers_count"]?.stringValue
        cell.branchType.text = dict["default_branch"] as? String
        cell.language.text = dict["language"] as? String
        
        return cell
    }
    //"", method: .get, parameters: ["q": repository]
    func getRepositoryByName(repository: String) {
        Alamofire.request("https://api.github.com/search/repositories?", method: .get, parameters:["q":repository])
            .responseJSON { (responseData) -> Void in
            let swiftyJsonVar = JSON(responseData.result.value!)
            if let resData = swiftyJsonVar["items"].arrayObject {
                self.arrRes = resData as! [[String:AnyObject]]
            }
            if self.arrRes.count > 0 {
                self.repositoryTableView.reloadData()
            }
            self.title = "\(self.arrRes.count) Repositórios encontrados"
        }
    }
}
