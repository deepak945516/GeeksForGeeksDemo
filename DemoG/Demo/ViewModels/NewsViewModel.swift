//
//  NewsViewModel.swift
//  Demo
//

import Foundation

final class NewsViewModel {
	var news: News?
	private var newsListViewModel: [NewsListViewModel] = []
	
	func getNews(_ completion: @escaping ((Bool) -> ())) {
		APIManager.shared.hitNewsFeedAPI { [unowned self] optionalNews in
			if let unwrappedNews = optionalNews {
				news = unwrappedNews
				newsListViewModel = unwrappedNews.items?.compactMap { NewsListViewModel(model: $0) } ?? []
				completion(true)
			} else {
				completion(false)
			}
		}
	}
	
	var numberOfSections: Int {
		1
	}
	
	func numberOfRows(in section: Int) -> Int {
		newsListViewModel.count
	}
	
	func data(at indexPath: IndexPath) -> NewsListViewModel {
		newsListViewModel[indexPath.row]
	}
}
