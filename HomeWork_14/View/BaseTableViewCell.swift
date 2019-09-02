//
//  UIImageView.swift
//  HomeWork_14
//
//  Created by MAC OS  on 01.09.2019.
//  Copyright © 2019 MAC OS . All rights reserved.
//

import Foundation
import UIKit

class BaseTableViewCell: UITableViewCell {
  
  private weak var imagePhotoTask: URLSessionDataTask?
  
  override func prepareForReuse() {
    super.prepareForReuse()
    
    imagePhotoTask?.cancel()
    
  }
  
  func loadImage(url: URL, success: @escaping (UIImage) -> ()) {
    let task = URLSession.shared.dataTask(with: url) { data, _, _ in
      guard let data = data, let image = UIImage(data: data) else { return }
      success(image)
      
    }
    imagePhotoTask = task
    task.resume()
  }
  
}
