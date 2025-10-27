//
//  NewsDetailViewController.swift
//  News
//
//  Created by Sida on 27/10/25.
//

import UIKit
import SwiftHelperInit

class NewsDetailViewController: UIViewController {
    private var article: Article!
    private lazy var scrollView: UIScrollView? = nil
    private lazy var contentView: UIView? = nil
    private lazy var imageView: UIImageView? = nil
    private lazy var titleLabel: UILabel? = nil
    private lazy var dateLabel: UILabel? = nil
    private lazy var descriptionLabel: UILabel? = nil
    
    
    init(article: Article) {
        self.article = article
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupData()
    }
    
    
    private func setupUI(){
        scrollView = UIScrollView()
        contentView = UIView()
        imageView = UIImageView()
        titleLabel = UILabel(text: "",numberOfLines: 0, textAlignment: .natural)
        dateLabel = UILabel(text: "", textColor: .lightGray, font: .systemFont(ofSize: 12), numberOfLines: 1,textAlignment: .right)
        descriptionLabel = UILabel(text: "",numberOfLines: 0, textAlignment: .natural)
        
        view.backgroundColor = .systemBackground
        
        view.addSubViewWithConstraints(scrollView!, top: view.safeAreaLayoutGuide.topAnchor, leading: view.leadingAnchor, bottom: view.safeAreaLayoutGuide.bottomAnchor, trailing: view.trailingAnchor)
        
        scrollView?.addSubViewWithConstraints(contentView!, top: scrollView?.frameLayoutGuide.topAnchor, leading: scrollView?.frameLayoutGuide.leadingAnchor, bottom: scrollView?.frameLayoutGuide.bottomAnchor, trailing: scrollView?.frameLayoutGuide.trailingAnchor)
        contentView?.widthAnchor.constraint(equalTo: scrollView!.frameLayoutGuide.widthAnchor).isActive = true
        
        contentView?.addSubViewWithConstraints(imageView!, top: contentView?.topAnchor, leading: contentView?.leadingAnchor, bottom: nil, trailing: contentView?.trailingAnchor)
        imageView?.constrainHeight(view.frame.width * 0.7)
        
        contentView?.addSubViewWithConstraints(titleLabel!, top: imageView?.bottomAnchor, leading: contentView?.leadingAnchor, bottom: nil, trailing: contentView?.trailingAnchor, padding: .init(top: 16, left: 16, right: 16))
        
        contentView?.addSubViewWithConstraints(dateLabel!, top: titleLabel?.bottomAnchor, leading: contentView?.leadingAnchor, bottom: nil, trailing: contentView?.trailingAnchor, padding: .init(top: 16, left: 16, right: 16))
        
        contentView?.addSubViewWithConstraints(descriptionLabel!, top: dateLabel?.bottomAnchor, leading: contentView?.leadingAnchor, bottom: nil, trailing: contentView?.trailingAnchor, padding: .init(top: 16, left: 16, right: 16))
        
    }
    
    private func setupData(){
        imageView?.loadImage(from: article.urlToImage ?? "", contentMode: .scaleAspectFill)
        titleLabel?.text = article.title
        dateLabel?.text = article.publishedAt
        descriptionLabel?.text = article.description
    }
}
