//
//  NewsResponseModel.swift
//  News
//
//  Created by Sida on 15/10/25.
//

import Foundation
struct NewsResponseModel: Codable {
    let status: String
    let totalResults: Int
    let articles : [Article]
}


struct Article: Codable {
    let title: String?
    let description: String?
    let url: String?
    let urlToImage: String?
    let publishedAt: String?
    let content: String?
    let author: String?
    let source: Source?
}

struct Source: Codable{
    let id: String?
    let name: String?
}
