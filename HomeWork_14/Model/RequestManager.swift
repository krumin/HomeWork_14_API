//
//  Manager.swift
//  HomeWork_14
//
//  Created by MAC OS  on 31.08.2019.
//  Copyright © 2019 MAC OS . All rights reserved.
//

import Foundation

class RequestManager {
  
  enum MyError: Error {
    case badUrl
    case badData(Error)
    case noData(Error)
    case undefined
  }
  
  static let shared = RequestManager()
  
  private init() {}
  
  func loadRequestItems(success: @escaping ([Todos]) -> (), onError: @escaping (MyError) -> ()) {
    guard let myURL = URL(string: "https://jsonplaceholder.typicode.com/users/1/todos") else {
      onError(.badUrl)
      return
    }
    
    let session = URLSession.shared
    
    session.dataTask(with: myURL) { (data, response, error) in
      if let data = data {
        
        let decoder = JSONDecoder()
        do {
          let tasks = try decoder.decode([Todos].self, from: data)
          success(tasks)
        } catch let error {
          onError(.badData(error))
        }
      } else {
        if let error = error {
          onError(.noData(error))
        } else {
          onError(.undefined)
        }
      }
      }.resume()
  }
  
  func loadRequestAlbums(success: @escaping ([Album]) -> (), onError: @escaping (MyError) -> ()) {
    guard let myURL = URL(string: "https://jsonplaceholder.typicode.com/users/1/albums") else {
      onError(.badUrl)
      return
    }
    
    let session = URLSession.shared
    
    session.dataTask(with: myURL) { (data, response, error) in
      if let data = data {
        
        let decoder = JSONDecoder()
        do {
          let albums = try decoder.decode([Album].self, from: data)
          success(albums)
        } catch let error {
          onError(.badData(error))
        }
      } else {
        if let error = error {
          onError(.noData(error))
        } else {
          onError(.undefined)
        }
      }
      }.resume()
  }
  
  func loadPhotoAndText(success: @escaping ([Photo]) -> (), onError: @escaping (MyError) -> ()) {
    guard let myURL = URL(string: "https://jsonplaceholder.typicode.com/albums/1/photos") else {
      onError(.badUrl)
      return
    }
    
    let session = URLSession.shared
    
    session.dataTask(with: myURL) { (data, response, error) in
      if let data = data {
        
        let decoder = JSONDecoder()
        do {
          let photos = try decoder.decode([Photo].self, from: data)
          success(photos)
        } catch let error {
          onError(.badData(error))
        }
      } else {
        if let error = error {
          onError(.noData(error))
        } else {
          onError(.undefined)
        }
      }
      }.resume()
  }
  
}
