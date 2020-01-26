//
//  NewsService.swift
//  SegmentedControl
//
//  Created by Nikolay Alexeyev on 15.01.2020.
//  Copyright © 2020 exey. All rights reserved.
//

import Foundation
import NewsAPIClient

final class NewsService: NewsServiceInput {
	
	func fetchArticleCount(completion: @escaping ((_ data: [(String, Int)]?) -> Void)) {
		let apikey = "a9b0a70b40c7497fae2f6cff41567103"
		let sortBy = "publishedAt"
		let fromDate = "2020-01-01"
		let group = DispatchGroup()
		var pairs = [(String, Int)]()
		
		group.enter()
		ArticlesAPI.everythingGet(q: Constants.apple, from: fromDate, sortBy: sortBy, apiKey: apikey) { (list, error) in
			let count = list?.totalResults ?? 0
			pairs.append((Constants.apple, count))
			group.leave()
		}
		
		group.enter()
		ArticlesAPI.everythingGet(q: Constants.bitcoin, from: fromDate, sortBy: sortBy, apiKey: apikey) { (list, error) in
			let count = list?.totalResults ?? 0
			pairs.append((Constants.bitcoin, count))
			group.leave()
		}
		
		group.enter()
		ArticlesAPI.everythingGet(q: Constants.nginx, from: fromDate, sortBy: sortBy, apiKey: apikey) { (list, error) in
			let count = list?.totalResults ?? 0
			pairs.append((Constants.nginx, count))
			group.leave()
		}
		
		group.notify(queue: .main) {
			completion(pairs)
		}
	}
	
}
