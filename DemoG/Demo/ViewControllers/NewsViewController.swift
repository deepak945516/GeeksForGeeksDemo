//
//  NewsViewController.swift
//  Demo
//

import UIKit

enum CellType: Int {
	case header, normal
}

final class NewsViewController: BaseViewController {
	// MARK: - IBOutlets
	@IBOutlet weak private var newsTableView: UITableView!
	private let refreshControl = UIRefreshControl()
	private var newsViewModel: NewsViewModel!
	private let headerRowHeight: CGFloat = 350
	private let rowHeight: CGFloat = 150
	
	// MARK: - Life Cycle Methods
	override func viewDidLoad() {
		super.viewDidLoad()
		initialSetup()
	}
	
	// MARK: - Private Methods
	private func initialSetup() {
		navigationController?.navigationBar.barStyle = .black
		newsViewModel = NewsViewModel()
		refreshControl.addTarget(self, action: #selector(pullToRefresh), for: .valueChanged)
		newsTableView.refreshControl = refreshControl
		newsTableView.register(UINib(nibName: NewsTableViewCell.className, bundle: nil), forCellReuseIdentifier: NewsTableViewCell.className)
		newsTableView.register(UINib(nibName: NewsHeaderTableViewCell.className, bundle: nil), forCellReuseIdentifier: NewsHeaderTableViewCell.className)
		navigationItem.largeTitleDisplayMode = .always
		fetchData()
	}
	
	private func fetchData(isRefresh: Bool = false) {
		if isRefresh {
			refreshControl.beginRefreshing()
		} else {
			showActivityIndicator()
		}
		newsViewModel.getNews() { [unowned self] _ in
			DispatchQueue.main.async {
				if isRefresh {
					refreshControl.endRefreshing()
				} else {
					hideActivityIndicator()
				}
				newsTableView.reloadData()
			}
		}
	}
	
	@IBAction private func pullToRefresh() {
		fetchData(isRefresh: true)
	}
}

// MARK: - UITableViewDataSource
extension NewsViewController: UITableViewDataSource {
	func numberOfSections(in tableView: UITableView) -> Int {
		newsViewModel.numberOfSections
	}
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		newsViewModel.numberOfRows(in: section)
	}
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		switch CellType(rawValue: indexPath.row) {
		case .header:
			if let cell = tableView.dequeueReusableCell(withIdentifier: NewsHeaderTableViewCell.className) as? NewsHeaderTableViewCell {
				cell.configure(data: newsViewModel.data(at: indexPath))
				return cell
			}
		default:
			if let cell = tableView.dequeueReusableCell(withIdentifier: NewsTableViewCell.className) as? NewsTableViewCell {
				cell.configure(data: newsViewModel.data(at: indexPath))
				return cell
			}
		}
		return UITableViewCell()
	}
}

extension NewsViewController: UITableViewDelegate {
	func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
		switch CellType(rawValue: indexPath.row) {
		case .header: return headerRowHeight
		default: return rowHeight
		}
	}
}
