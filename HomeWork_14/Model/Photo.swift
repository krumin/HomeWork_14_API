//
//  Photo.swift
//  HomeWork_14
//
//  Created by MAC OS  on 31.08.2019.
//  Copyright © 2019 MAC OS . All rights reserved.
//

import Foundation

class Photo: Decodable {
  let albumId: Int
  let id: Int
  let title: String
  let url: String
  let thumbnailUrl: URL
}


