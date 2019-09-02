//
//  AlbumsViewController.swift
//  HomeWork_14
//
//  Created by MAC OS  on 29.08.2019.
//  Copyright © 2019 MAC OS . All rights reserved.
//

import UIKit

class AlbumsListViewController: UITableViewController {
  
  private var albums: [Album] = [] {
    didSet {
      DispatchQueue.main.async {
        self.tableView.reloadData()
      }
    }
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    title = "Albums"
    
    print("viewdidload. albums count: \(self.albums.count)")
    
    RequestManager.shared.loadRequestAlbums(success: { [weak self] album in
      guard let self = self else { return }
      self.albums = album
      print("success. albums count: \(self.albums.count)")
      
      }, onError: { error in
        switch error {
        case .badUrl:
          print("ooops. bad url")
        case .badData(let error):
          print("ooops. bad text error: \(error)")
        case .noData(let myError):
          print("no data error: \(myError.localizedDescription)")
        case .undefined:
          print("undefined")
        }
    })
    
  }
  
  // MARK: - Table view data source
  
  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return albums.count
  }
  
  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
    guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as? AlbumsTableViewCell else {
      return UITableViewCell()
    }
    
    let album = albums[indexPath.row]
    cell.loadAlbum(with: album)
    cell.textLabel?.text = "\(album.id):"
    return cell
  }
  
}

