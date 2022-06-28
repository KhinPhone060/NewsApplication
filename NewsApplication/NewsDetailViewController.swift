//
//  NewsDetailViewController.swift
//  NewsApplication
//
//  Created by Khin Phone Ei on 27/06/2022.
//

import UIKit
import Kingfisher

class NewsDetailViewController: UIViewController {
    
    @IBOutlet var newsDetailImage: UIImageView!
    @IBOutlet var newsDetailTitle: UILabel!
    @IBOutlet var newsDetailContent: UILabel!
    
    
    var news: News?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view
        let url = URL(string: news?.imageURL ?? "")
        newsDetailImage.kf.setImage(with: url)
        newsDetailTitle.text = news?.title
        newsDetailContent.text = news?.content
        
        
    }
}
