//
//  Resources.swift
//  HomeWork_14
//
//  Created by MAC OS  on 29.08.2019.
//  Copyright © 2019 MAC OS . All rights reserved.
//

import Foundation

struct Todos: Decodable {
  let userId: Int
  let id: Int
  let title: String
  let completed: Bool
  
//  enum Keys: String, CodingKey {
//    case userID = "userID"
//    case id = "id"
//    case title = "title"
//    case completed = "competed"
//  }  
}
