//
//  ViewController.swift
//  NewsApplication
//
//  Created by Khin Phone Ei on 25/06/2022.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet var newsTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        newsTableView.rowHeight = UITableView.automaticDimension
        let cellNib = UINib(nibName: "NewsTableViewCell", bundle: nil)
        newsTableView.register(cellNib, forCellReuseIdentifier: "NewsTableViewCell")
        newsTableView.dataSource = self
        newsTableView.delegate = self
    }
    
    //Table View Delegate
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let newsCell = tableView.dequeueReusableCell(withIdentifier: "NewsTableViewCell", for: indexPath) as! NewsTableViewCell
        return newsCell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "showNewsDetail", sender: self)
    }
}

