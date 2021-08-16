//
//  NewsListViewModel.swift
//  Demo
//


import Foundation

struct NewsListViewModel {
    var model: Item
    
	var title: String {
		model.title ?? ""
	}
	
	var newsPublishedDate: String {
		let dateFormatter = DateFormatter()
		dateFormatter.timeZone = TimeZone(secondsFromGMT: 0)
		dateFormatter.locale = Locale(identifier: "en-US")
		dateFormatter.dateFormat = "yyyy-mm-dd h:mm:SS"
		let originalDateString = (model.pubDate ?? "").trimmingCharacters(in: .whitespacesAndNewlines)
		guard let date = dateFormatter.date(from: originalDateString) else {
			return ""
		}
		dateFormatter.timeZone = .current
		dateFormatter.locale = .current
		dateFormatter.dateFormat = "MMM dd, yyyy h:mm a"
		let formattedDateString = dateFormatter.string(from: date)
		return formattedDateString
	}
	
	var thumbnailUrl: URL? {
		let validUrl = model.thumbnail?.replacingOccurrences(of: "amp;", with: "") ?? ""
		return URL(string: validUrl)
	}
	
	var linkImage: URL? {
		let validUrl = model.enclosure?.link?.replacingOccurrences(of: "amp;", with: "") ?? ""
		return URL(string: validUrl)
	}
}
