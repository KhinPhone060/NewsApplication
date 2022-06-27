//
//  NewsService.swift
//  NewsApplication
//
//  Created by Khin Phone Ei on 27/06/2022.
//

import Foundation
import Alamofire
import ObjectMapper

final class NewsService {
    func fetchNews(completionHandler: @escaping (_ newslist: [News]) -> Void) {
        let url = "https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=5c9bb4e194434ab281fb1b329fad774d"
        
        AF.request(url, encoding: JSONEncoding.default)
                .responseJSON { response in
                    switch response.result {
                    case .success(let value):
                        if let resultDict = value as? [String: Any],
                           let articleDict = resultDict["articles"] as? [[String: Any]]
                        {
                            if let newsList = Mapper<News>().mapArray(JSONObject: articleDict) {
                                completionHandler(newsList)
                            }
                        }
                    case .failure(let error):
                        print(error)
                    }
                }
    }
}
