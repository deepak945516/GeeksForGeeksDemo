//
//  APIManager.swift
//  Demo
//

import UIKit

struct APIManager {
	// MARK: - Properties
	private let newsFeedUrl = "https://api.rss2json.com/v1/api.json?rss_url=http://www.abc.net.au/news/feed/51120/rss.xml"
	static let shared = APIManager()
	
	// MARK: - Private Init
	private init() {}
	
	// MARK: - API Request
	func hitNewsFeedAPI(_ completion: @escaping (News?) -> ()) {
		guard let newsUrl = URL(string: newsFeedUrl) else {
			return
		}
		URLSession.shared.dataTask(with: newsUrl) { data, response, error in
			guard let data = data, error == nil else {
				completion(nil)
				return
			}
			do {
				let news = try JSONDecoder().decode(News.self, from: data)
				completion(news)
			} catch let decodeError {
				completion(nil)
				debugPrint("JSON Decode ERROR: \(decodeError)")
			}
		}.resume()
	}
}
