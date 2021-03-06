//
//  ViewController.swift
//  NewsApplication
//
//  Created by Khin Phone Ei on 25/06/2022.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let targetVC = segue.destination as? NewsDetailViewController,
           let news = sender as? News {
            targetVC.news = news
        }
    }
    
    @IBOutlet var newsTableView: UITableView!
    var newsList = [News]()
    override func viewDidLoad() {
        super.viewDidLoad()
        getLatestNews()
        
        newsTableView.rowHeight = UITableView.automaticDimension
        let cellNib = UINib(nibName: "NewsTableViewCell", bundle: nil)
        newsTableView.register(cellNib, forCellReuseIdentifier: "NewsTableViewCell")
        newsTableView.dataSource = self
        newsTableView.delegate = self
    }
    
    func getLatestNews() {
            let newsService = NewsService()
            newsService.fetchNews(completionHandler: {[weak self] newsList in
                self?.newsList = newsList
                self?.newsTableView.reloadData()
            })
        }
    
    //Table View Delegate
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.newsList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let newsCell = tableView.dequeueReusableCell(withIdentifier: "NewsTableViewCell", for: indexPath) as! NewsTableViewCell
        newsCell.configCell(news: self.newsList[indexPath.row])
        return newsCell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if newsList.count > 0 {
            let news = newsList[indexPath.row]
            performSegue(withIdentifier: "showNewsDetail", sender: news)
        }
    }
}

