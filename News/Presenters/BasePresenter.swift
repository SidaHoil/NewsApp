//
//  BasePresenter.swift
//  News
//
//  Created by Sida on 12/11/25.
//

import Foundation
import SVProgressHUD

protocol BaseView: AnyObject {
    func showLoading()
    func hideLoading()
    func showError(_ message: String)
}

extension BaseView {
    func showLoading() {
        LoadingManager.show()
    }
    
    func hideLoading() {
        LoadingManager.hide()
    }
    
    func showError(_ message: String) {
        LoadingManager.hide()
        SVProgressHUD.showError(withStatus: message)
    }
}
