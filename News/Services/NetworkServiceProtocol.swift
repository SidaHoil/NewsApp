//
//  NetworkService.swift
//  News
//
//  Created by Sida on 15/10/25.
//

import Foundation

protocol NetworkServiceProtocol{
    func fetchNews(completion: @escaping (Result<[Article],Error>) -> ())
}
