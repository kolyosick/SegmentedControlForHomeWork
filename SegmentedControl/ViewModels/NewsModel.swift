//
//  NewsModel.swift
//  SegmentedControl
//
//  Created by Nikolay Alexeyev on 15.01.2020.
//  Copyright © 2020 exey. All rights reserved.
//

import Foundation

final class NewsModel: ObservableObject {
	let service: NewsServiceInput!
	@Published private(set) var articleCount = [(Constants.apple, 1),
												(Constants.bitcoin, 1),
												(Constants.nginx, 1)]
	
	init() {
		service = ServiceLocator.shared.getService()
		fetchArticleCount()
	}
	
	func fetchArticleCount() {
		service.fetchArticleCount() { [weak self] data in
			if data != nil {
				self?.articleCount = data!
			}
		}
	}
}
