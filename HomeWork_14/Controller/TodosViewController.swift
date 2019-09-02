//
//  ViewController.swift
//  HomeWork_14
//
//  Created by MAC OS  on 29.08.2019.
//  Copyright © 2019 MAC OS . All rights reserved.
//

import UIKit

class TodosViewController: UITableViewController {
  
  private var task = [Todos]() {
    didSet {
      DispatchQueue.main.async {
        self.tableView.reloadData()
      }
    }
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    title = "Todos"
    
    print("viewdidload. items count: \(self.task.count)")
    
    RequestManager.shared.loadRequestItems(success: { [weak self] tasks in
      guard let self = self else { return }
      self.task = tasks
      print("success. items count: \(self.task.count)")
      
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
    return task.count
  }
  
  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
    guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as? TodosTableViewCell else {
      return UITableViewCell()
    }
    
    let tasks = task[indexPath.row]
    cell.load(with: tasks)
    cell.textLabel?.text = "\(tasks.id):"
    return cell
  }
  
}

