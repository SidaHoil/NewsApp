//
//  NewsCell.swift
//  News
//
//  Created by Sida on 15/10/25.
//

import UIKit
import SwiftHelperInit

extension UIView{
    convenience init(style: CornerStyle){
        self.init()
        self.clipsToBounds = true
        self.layer.cornerRadius = style.radius
        self.layer.borderColor = style.color.cgColor
        self.layer.borderWidth = style.width
    }
}
class NewsCell: UITableViewCell {
    var article: Article!{
        didSet{
            titleLabel.text = article.content
            if let url = article.urlToImage{
                newsImageView.loadImage(from: url)
            }
            dateLabel.text = article.publishedAt
            subTitleLabel.text = article.description
            
        }
    }
    private let titleLabel: UILabel!
    private let dateLabel: UILabel!
    private let newsImageView: UIImageView!
    //private let authorLabel: UILabel!
    private let subTitleLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        titleLabel = UILabel(text: "Title",font: .boldSystemFont(ofSize: 16),numberOfLines: 1)
        dateLabel = UILabel(text: "Date",textColor: .gray,font: .systemFont(ofSize: 10), numberOfLines: 1)
        newsImageView = UIImageView()
        //authorLabel = UILabel(text: "Author")
        subTitleLabel = UILabel(text: "Sub Title",numberOfLines: 3)
        
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        let stackView = UIStackView(subViews: [
            UIView(width: 3),
            UIStackView(subViews: [
                UIView(height: 5),
                titleLabel,
                dateLabel,
                subTitleLabel,
                UIView(height: 3)
                
            ], distribution: .fillProportionally,axis: .vertical, spacing: 0),
            newsImageView
        ],distribution: .fillProportionally,spacing: 10)
        
        let view = UIView(style: CornerStyle.init(radius: 10, color: .gray,width: 0.18))
        view.clipsToBounds = true
        contentView.addSubViewToFill(view, padding: .init(top: 5, left: 10, bottom: 5, right: 10))
        
        
        view.addSubViewToFill(stackView)
        imageView?.clipsToBounds = true
        newsImageView.setSize(width: 103, height: 103)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        
    }

}

