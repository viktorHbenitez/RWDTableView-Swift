//
//  ViewController.swift
//  Checklists
//
//  Created by Matthijs on 04/07/2016.
//  Copyright © 2016 Razeware. All rights reserved.
//

import UIKit

class ChecklistViewController: UITableViewController {
  
  var row0item : ChecklistItem
  var row1item : ChecklistItem
  var row2item : ChecklistItem
  var row3item : ChecklistItem
  var row4item : ChecklistItem
  
  var items : [ChecklistItem]
  
  /*Load from storyboard during app startup init?(coder) is called
   great place for putting values into any variable in the viewController
   this method is called when a class is restored from safe location
  in this case the storyboard is loading the class and creating a new instance of it*/
  required init?(coder aDecoder: NSCoder) {
    

    items = [ChecklistItem]()
    
    row0item = ChecklistItem()
    row0item.text = "Walk the dog"
    row0item.checked = false
    
    row1item = ChecklistItem()
    row1item.text = "Brush my teeth"
    row1item.checked = true
    
    row2item = ChecklistItem()
    row2item.text = "Learn iOS development"
    row2item.checked = true
    row3item = ChecklistItem()
    
    row3item.text = "Soccer practice"
    row3item.checked = false
    
    row4item = ChecklistItem()
    row4item.text = "Eat ice cream"
    row4item.checked = true
    

     // we have to init the objects before super.init(coder)
    super.init(coder: aDecoder)
    
  }
  
  
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
    
    if indexPath.row == 0 {
      label.text = row0item.text
    } else if indexPath.row == 1 {
      label.text = row1item.text
    } else if indexPath.row == 2 {
      label.text = row2item.text
    } else if indexPath.row == 3 {
      label.text = row3item.text
    } else if indexPath.row == 4 {
      label.text = row4item.text
    }
    
    configureCheckmark(for: cell, at: indexPath)
    
    return cell
  }
  
  override func tableView(_ tableView: UITableView,
                          didSelectRowAt indexPath: IndexPath) {
    
    
    if let cell = tableView.cellForRow(at: indexPath){
      // Change the value of the value
      if indexPath.row == 0 {
        row0item.checked = !row0item.checked
      } else if indexPath.row == 1 {
        row1item.checked = !row1item.checked
      } else if indexPath.row == 2 {
        row2item.checked = !row2item.checked
      } else if indexPath.row == 3 {
        row3item.checked = !row3item.checked
      } else if indexPath.row == 4 {
        row4item.checked = !row4item.checked
      }
      
      configureCheckmark(for: cell, at: indexPath)
      
    }
    
    tableView.deselectRow(at: indexPath, animated: true)
  }
  
  func configureCheckmark(for cell: UITableViewCell,
                          at indexPath: IndexPath) {
    var isChecked = false // Inital value switch off
    
    if indexPath.row == 0 {
      isChecked = row0item.checked
    } else if indexPath.row == 1 {
      isChecked = row1item.checked
    } else if indexPath.row == 2 {
      isChecked = row2item.checked
    } else if indexPath.row == 3 {
      isChecked = row3item.checked
    } else if indexPath.row == 4 {
      isChecked = row4item.checked
    }
    
    if isChecked {  // isOFF .none 
      cell.accessoryType = .checkmark
    } else {
      cell.accessoryType = .none
    }
  }
  
}
