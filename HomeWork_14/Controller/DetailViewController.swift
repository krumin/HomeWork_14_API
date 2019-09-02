//
//  DetailViewController.swift
//  HomeWork_14
//
//  Created by MAC OS  on 29.08.2019.
//  Copyright © 2019 MAC OS . All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
  
  @IBOutlet weak var detailPhotoImageView: UIImageView!
  
  var photo: Photo?
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    
    if let photoUrlString = photo?.url, let url = URL.init(string: photoUrlString) {
      loadImage(url: url) { [weak self] myimage in
        guard let self = self else { return }
        DispatchQueue.main.async {
          self.detailPhotoImageView.image = myimage
        }
      }
    }
  }
  
  func loadImage(url: URL, success: @escaping (UIImage) -> ()) {
    let task = URLSession.shared.dataTask(with: url) { data, _, _ in
      guard let data = data, let image = UIImage(data: data) else { return }
      success(image)
      
    }
    task.resume()
  }
  
}
