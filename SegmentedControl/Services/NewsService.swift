//
//  NewsService.swift
//  SegmentedControl
//
//  Created by Nikolay Alexeyev on 15.01.2020.
//  Copyright © 2020 exey. All rights reserved.
//

import Foundation
import NewsAPIClient
import Combine

final class NewsService: NewsServiceInput {
	
	func fetchArticleCount(completion: @escaping ((_ data: [(String, Int)]?) -> Void)) {
		let apikey = "a9b0a70b40c7497fae2f6cff41567103"
		let sortBy = "publishedAt"
		let fromDate = "2020-01-01"
		
		let future1 = Deferred{Future<(String, Int), Error> { promise in
			ArticlesAPI.everythingGet(q: Constants.apple, from: fromDate, sortBy: sortBy, apiKey: apikey) { (list, error) in
				let count = list?.totalResults ?? 0
				print(count)
				promise(.success((Constants.apple, count)))
			}
		}}
		let future2 = Deferred{Future<(String, Int), Error> { promise in
			ArticlesAPI.everythingGet(q: Constants.bitcoin, from: fromDate, sortBy: sortBy, apiKey: apikey) { (list, error) in
				let count = list?.totalResults ?? 0
				print(count)
				promise(.success((Constants.bitcoin, count)))
			}
		}}

		_ = Publishers.Zip(future1, future2)
			.sink(receiveCompletion: {_ in}) {_ in print("Done")}
	}
	
}
