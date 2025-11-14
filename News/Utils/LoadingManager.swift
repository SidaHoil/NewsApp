//
//  LoadingManager.swift
//  News
//
//  Created by Sida on 14/11/25.
//

import SVProgressHUD

public final class LoadingManager {
    
    public static func show() {
        SVProgressHUD.show()
    }
    
    public static func show(message: String) {
        SVProgressHUD.show(withStatus: message)
    }
    
    public static func hide() {
        SVProgressHUD.dismiss()
    }
}
