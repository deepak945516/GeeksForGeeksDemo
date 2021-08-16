
import Foundation

// MARK: - News
struct News: Codable {
	let status: String?
	let feed: Feed?
	let items: [Item]?
}

// MARK: - Feed
struct Feed: Codable {
	let url: String?
	let title: String?
	let link: String?
	let author, feedDescription: String?
	let image: String?
}

// MARK: - Item
struct Item: Codable {
	let title, pubDate: String?
	let link, guid: String?
	let author: String?
	let thumbnail: String?
	let itemDescription, content: String?
	let enclosure: Enclosure?
	let categories: [String]?
}

// MARK: - Enclosure
struct Enclosure: Codable {
	let link: String?
	let type: String?
	let thumbnail: String?
}
