//
//  News.swift
//  NewsApplication
//
//  Created by Khin Phone Ei on 27/06/2022.
//

import Foundation
import ObjectMapper

class News: Mappable {
    var title: String?
    var description: String?
    var imageURL: String?
    var content: String?
    var url: String?
    
    required init?(map: Map) {

    }

    // Mappable
    func mapping(map: Map) {
        title <- map["title"]
        description <- map["description"]
        imageURL <- map["urlToImage"]
        content <- map["content"]
        url <- map["url"]
    }
}
