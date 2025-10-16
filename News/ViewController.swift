//
//  ViewController.swift
//  News
//
//  Created by Sida on 15/10/25.
//

import UIKit

class ViewController: UIViewController {
    private let cellId = "cell899"
    private var articles = [Article]()
    private let presenter = NewsPresenter(service: NetworkService())
    
    let tableView = UITableView()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        setupView()
        presenter.attachView(self)
        presenter.getNews()
        
    }
    
    private func setupView() {
        title = "Top Headlines"
        tableView.backgroundColor = .systemBackground
        tableView.register(NewsCell.self, forCellReuseIdentifier: cellId)
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 100
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        
        tableView.dataSource = self
        tableView.delegate = self
    }
    
}

extension ViewController:  UITableViewDataSource, UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return articles.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! NewsCell
        cell.article = articles[indexPath.row]
        return cell
    }

}

extension ViewController: NewsView{
    func showLoading() {
        print("Loading show.....")
    }
    
    func hideLoading() {
        print("Loading hide....")
    }
    
    func showNews(_ articles: [Article]) {
        self.articles = articles
        tableView.reloadData()
    }
    
    func showError(_ message: String) {
        print(message)
    }
    
    
}
