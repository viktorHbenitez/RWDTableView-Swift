//
//  ViewController.swift
//  Checklists
//
//  Created by Matthijs on 04/07/2016.
//  Copyright © 2016 Razeware. All rights reserved.
//

import UIKit

class ChecklistViewController: UITableViewController {
  
  let row0text = "Walk the dog"
  let row1text = "Brush my teeth"
  let row2text = "Learn iOS development"
  let row3text = "Soccer practice"
  let row4text = "Eat ice cream"
  
  var row0checked = true
  var row1checked = false
  var row2checked = true
  var row3checked = false
  var row4checked = true
  
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
  override func tableView(_ tableView: UITableView,
                          numberOfRowsInSection section: Int) -> Int {
    return 100
  }
  
  override func tableView(_ tableView: UITableView,
                          cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
    let cell = tableView.dequeueReusableCell(
      withIdentifier: "ChecklistItem", for: indexPath)
    
    // make sure you select the label with the correct tag in the cell
    let label = cell.viewWithTag(1000) as! UILabel
    
    if indexPath.row % 5 == 0 {
      label.text = row0text
    } else if indexPath.row % 5 == 1 {
      label.text = row1text
    } else if indexPath.row % 5 == 2 {
      label.text = row2text
    } else if indexPath.row % 5 == 3 {
      label.text = row3text
    } else if indexPath.row % 5 == 4 {
      label.text = row4text
    }
    
    configureCheckmark(for: cell, at: indexPath)
    
    return cell
  }
  
  override func tableView(_ tableView: UITableView,
                          didSelectRowAt indexPath: IndexPath) {
    

    if let cell = tableView.cellForRow(at: indexPath){
      // Change the value of the value
      if indexPath.row == 0 {
        row0checked = !row0checked  // Change the value and see global
      } else if indexPath.row == 1 {
        row1checked = !row1checked
      } else if indexPath.row == 2 {
        row2checked = !row2checked
      } else if indexPath.row == 3 {
        row3checked = !row3checked
      } else if indexPath.row == 4 {
        row4checked = !row4checked
      }
      
      configureCheckmark(for: cell, at: indexPath)
      
    }
    
    tableView.deselectRow(at: indexPath, animated: true)
  }
  
  func configureCheckmark(for cell: UITableViewCell,
                          at indexPath: IndexPath) {
    var isChecked = false // Inital value switch off
    
    if indexPath.row == 0 {
      isChecked = row0checked
    } else if indexPath.row == 1 {
      isChecked = row1checked
    } else if indexPath.row == 2 {
      isChecked = row2checked
    } else if indexPath.row == 3 {
      isChecked = row3checked
    } else if indexPath.row == 4 {
      isChecked = row4checked
    }
    if isChecked {  // isOFF .none 
      cell.accessoryType = .checkmark
    } else {
      cell.accessoryType = .none
    }
  }
  
}
