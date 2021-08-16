//
//  NewsHeaderTableViewCell.swift
//  Demo
//

import UIKit

final class NewsHeaderTableViewCell: UITableViewCell {
	// MARK: - Properties
	@IBOutlet weak private var newsHeaderImageView: UIImageView!
	@IBOutlet weak private var titleLabel: UILabel!
	@IBOutlet weak private var subtitleLabel: UILabel!
	
	// MARK: - Life Cycle Methods
    override func awakeFromNib() {
        super.awakeFromNib()
    }
	
	func configure(data: NewsListViewModel) {
		newsHeaderImageView.sd_setImage(with: data.thumbnailUrl, completed: nil)
		titleLabel.text = data.title
		subtitleLabel.text = data.newsPublishedDate
	}
}
