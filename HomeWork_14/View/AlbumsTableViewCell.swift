//
//  AlbumsTableViewCell.swift
//  HomeWork_14
//
//  Created by MAC OS  on 31.08.2019.
//  Copyright © 2019 MAC OS . All rights reserved.
//

import UIKit

class AlbumsTableViewCell: UITableViewCell {
  
  @IBOutlet weak var albumTextLabel: UILabel!
  
  func loadAlbum(with album: Album) {
    albumTextLabel.text = album.title
  }
  
}
