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
        let date = getDate()
        service.fetchNews(date: date) { [weak self] result in
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
    
    private func getDate() -> String{
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        
        var formattedDate = ""
        
        let today = Date()
        if let yesterday = Calendar.current.date(byAdding: .day, value: -1, to: today) {
            formattedDate = dateFormatter.string(from: yesterday)
        }else{
            let currentDate = Date()
            formattedDate = dateFormatter.string(from: currentDate)
        }
        return formattedDate
    }
    
}
