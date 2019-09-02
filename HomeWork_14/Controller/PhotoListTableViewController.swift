//
//  PhotoListTableViewController.swift
//  HomeWork_14
//
//  Created by MAC OS  on 31.08.2019.
//  Copyright © 2019 MAC OS . All rights reserved.
//

import UIKit

class PhotoListTableViewController: UITableViewController {
  
  var photo: Photo?
  
  let detailViewControllerSegue = "detailSegue"
  
  private var photos: [Photo] = [] {
    didSet {
      DispatchQueue.main.async {
        self.tableView.reloadData()
      }
    }
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    title = "Photos"
    
    print("viewdidload. albums count: \(self.photos.count)")
    
    RequestManager.shared.loadPhotoAndText(success: { [weak self] photo in
      guard let self = self else { return }
      self.photos = photo
      print("success. albums count: \(self.photos.count)")
      
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
    return photos.count
  }
  
  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
    guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as? PhotoTableViewCell else {
      return UITableViewCell()
    }
    
    let photo = photos[indexPath.row]
    cell.loadPhotoAndText(with: photo)
    return cell
  }
  
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    if segue.identifier == detailViewControllerSegue {
      guard let indexPath = tableView.indexPathForSelectedRow else { return }
      
      let photo = photos[indexPath.row]
      let destinationVC = segue.destination as! DetailViewController
      destinationVC.photo = photo
    }
  }
  
}
