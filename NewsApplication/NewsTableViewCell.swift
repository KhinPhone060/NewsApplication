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
    @IBOutlet var descLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        logoImageView.image = UIImage(named: "download")
        titleLabel.text = "Breaking News"
        descLabel.text = "Description"
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
