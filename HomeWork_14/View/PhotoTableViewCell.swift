//
//  PhotoTableViewCell.swift
//  HomeWork_14
//
//  Created by MAC OS  on 31.08.2019.
//  Copyright © 2019 MAC OS . All rights reserved.
//

import UIKit

class PhotoTableViewCell: BaseTableViewCell {
  
  @IBOutlet weak var photoImageView: UIImageView!
  @IBOutlet weak var photoTextLabel: UILabel!
  
  override func prepareForReuse() {
    super.prepareForReuse()
    
    photoImageView.image = nil
    
  }
  
  func loadPhotoAndText(with photo: Photo) {
    photoTextLabel.text = photo.title
    loadImage(url: photo.thumbnailUrl, success: { [weak self] image in
      guard let self = self else { return }
      DispatchQueue.main.async {
        self.photoImageView.image = image
      }
      
    })
  }
  
}
