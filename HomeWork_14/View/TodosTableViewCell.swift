//
//  ItemsTableViewCell.swift
//  HomeWork_14
//
//  Created by MAC OS  on 30.08.2019.
//  Copyright © 2019 MAC OS . All rights reserved.
//

import UIKit

class TodosTableViewCell: UITableViewCell {
  
  @IBOutlet weak var itemsTextLabel: UILabel!
  
  func load(with tasks: Todos) {
    itemsTextLabel.text = tasks.title
  }
  
}
