//
//  LazyImageView.swift
//  DemoApp
//
//  Created by Bellubis-WS29 on 07/11/23.
//  Copyright © 2023 Bellubis-WS29. All rights reserved.
//

import Foundation
import UIKit

class LazyImageView : UIImageView {
    private let imageCache = NSCache<AnyObject,UIImage>()
    func loadImage(fromURL imageURL : URL ,placeholderImage : String)
    {
        self.image = UIImage(named: placeholderImage)
        if let cachedImage = self.imageCache.object(forKey: imageURL as AnyObject){
            self.image = cachedImage
            return
        }
        
        DispatchQueue.global().async {
            [weak self] in
            if let imageData = try? Data(contentsOf: imageURL)
            {
                if let image = UIImage(data: imageData)
                {
                    DispatchQueue.main.async {
                        self!.imageCache.setObject(image, forKey: imageURL as AnyObject)
                        self?.image = image
                    }
                }
            }
        }
    }
}
