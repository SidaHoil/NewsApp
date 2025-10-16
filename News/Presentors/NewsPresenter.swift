//
//  NewsPresenter.swift
//  News
//
//  Created by Sida on 15/10/25.
//

import Foundation

//Presenter Delegate
protocol NewsView: AnyObject {
    
    func showLoading()
    
    func hideLoading()
    
    func showNews(_ articles: [Article])
    
    func showError(_ message: String)
    
}


class NewsPresenter {
    
    private let service: NetworkServiceProtocol
    
    weak private var view: NewsView?
    
    init(service: NetworkServiceProtocol) {
        self.service = service
    }
    
    func attachView(_ view: NewsView){
        self.view = view
    }
    
    func getNews(){
        view?.showLoading()
        service.fetchNews { [weak self] result in
            guard let self = self else { return }
            self.view?.hideLoading()
            switch result {
                case .success(let data):
                    self.view?.showNews(data)
                    break
                case .failure(let error):
                    self.view?.showError(error.localizedDescription)
                    break
            }
        }
    }
    
    
}
