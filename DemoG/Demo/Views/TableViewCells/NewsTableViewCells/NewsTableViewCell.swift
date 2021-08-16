//
//  NewsTableViewCell.swift
//  Demo
//

import UIKit
import SDWebImage

final class NewsTableViewCell: UITableViewCell {
    // MARK: - Properties
    @IBOutlet private weak var thumbnailImageView: UIImageView!
    @IBOutlet private weak var newsTitleLabel: UILabel!
    @IBOutlet private weak var newsPublishedDate: UILabel!
    
    // MARK: - Life Cycle Methods
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func configure(data: NewsListViewModel) {
		thumbnailImageView.sd_setImage(with: data.thumbnailUrl, completed: nil)
		newsTitleLabel.text = data.title
		newsPublishedDate.text = data.newsPublishedDate
    }
}
