//
//  NewsTableViewCell.swift
//  NewsApplication
//
//  Created by Khin Phone Ei on 26/06/2022.
//

import UIKit

class NewsTableViewCell: UITableViewCell {

    @IBOutlet var logoImageView: UIImageView!
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var containerView: UIView!
    @IBOutlet var descLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        containerView.layer.cornerRadius = 10
        containerView.layer.masksToBounds = true
        
        logoImageView.image = UIImage(named: "download")
        titleLabel.text = "Breaking News"
        descLabel.text = "Description"
    }
    
}
