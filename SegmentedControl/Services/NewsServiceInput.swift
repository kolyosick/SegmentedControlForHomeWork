//
//  NewsServiceInput.swift
//  SegmentedControl
//
//  Created by Nikolay Alexeyev on 24.01.2020.
//  Copyright © 2020 exey. All rights reserved.
//

import NewsAPIClient

protocol NewsServiceInput {
	func fetchArticleCount(completion: @escaping ((_ data: [(String, Int)]?) -> Void))
}
