//
//  UIImageView+.swift
//  EmployeeSignIn
//
//  Created by Bink Wang on 5/10/18.
//  Copyright © 2018 Bink Wang. All rights reserved.
//

import UIKit
import Foundation

extension UIImageView {
    
    func renderCellImage(imageUrl: String?) {
        self.image = UIImage(named: "AvatarPlaceholder") // to clear the existing image
        guard let imageUrl = imageUrl, let url = URL(string: imageUrl) else { return }
        
        URLSession.shared.dataTask(with: url) { [weak self, url] (data, response, error) -> Void in
            guard let weakSelf = self else { return }
            if let data = data, let responseUrl = response?.url {
                if url.absoluteString == responseUrl.absoluteString { // to confirmed the corrent image for the cell
                    DispatchQueue.main.async {
                        weakSelf.image = UIImage(data: data)
                    }
                }
            }
            }.resume()
    }
}