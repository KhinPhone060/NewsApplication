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
    @IBOutlet var newsSnippetTextView: UITextView!
      
      var news: News?
      
      override func viewDidLoad() {
          super.viewDidLoad()
          
          newsDetailTitle.text = news?.title
          if let imageUrlStr = news?.imageURL,
             let url = URL(string: imageUrlStr) {
              newsDetailImage.kf.setImage(with: url)
          }
          
          guard let newsContent = news?.content,
                let newsUrl = news?.url else { return }
          
          let newsAttributedStrAttributes = [
              NSAttributedString.Key.underlineStyle: NSUnderlineStyle.single.rawValue,
              NSAttributedString.Key.font: UIFont.systemFont(ofSize: 16.0),
              NSAttributedString.Key.link: URL(string: newsUrl),
          ] as [NSAttributedString.Key : Any]
          var newsAttributedStr = NSMutableAttributedString(string: findSubString(with: newsContent, from: "[", to: "]"), attributes: newsAttributedStrAttributes)
          newsSnippetTextView.attributedText = newsAttributedStr
      }
      
      func findSubString(with string: String, from firstCharacter: String, to secondCharacter: String) -> String {
          let specialChar: Character = "["
          if let idx = string.firstIndex(of: specialChar) {
              return string.substring(to: idx)
          }
          return ""
      }
  }
