//
//  ViewController.swift
//  Checklists
//
//  Created by Matthijs on 04/07/2016.
//  Copyright © 2016 Razeware. All rights reserved.
//

import UIKit

class ChecklistViewController: UITableViewController {
  
  
  
  var items : [ChecklistItem]
  
  /*Load from storyboard during app startup init?(coder) is called
   great place for putting values into any variable in the viewController
   this method is called when a class is restored from safe location
  in this case the storyboard is loading the class and creating a new instance of it*/
  required init?(coder aDecoder: NSCoder) {
    

    items = [ChecklistItem]()
    
    let row0item = ChecklistItem()
    row0item.text = "Walk the dog"
    row0item.checked = true
    items.append(row0item)
    
    let row1item = ChecklistItem()
    row1item.text = "Brush my teeth"
    row1item.checked = true
    items.append(row1item)
    
    let row2item = ChecklistItem()
    row2item.text = "Learn iOS development"
    row2item.checked = false
    items.append(row2item)
    
    let row3item = ChecklistItem()
    row3item.text = "Soccer practice"
    row3item.checked = false
    items.append(row3item)
    
    let row4item = ChecklistItem()
    row4item.text = "Eat ice cream"
    row4item.checked = true
    items.append(row4item)
    

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
    return items.count
  }
  
  override func tableView(_ tableView: UITableView,
                          cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
    let cell = tableView.dequeueReusableCell(
      withIdentifier: "ChecklistItem", for: indexPath)
    
    let item = items[indexPath.row]
    
    // make sure you select the label with the correct tag in the cell
    let label = cell.viewWithTag(1000) as! UILabel
    
    label.text = item.text
//    configureCheckmark(for: cell, at: indexPath)
    
    configureText(for: cell, with: item)
    configureCheckmark(for: cell, with: item)
    return cell
  }
  
  override func tableView(_ tableView: UITableView,
                          didSelectRowAt indexPath: IndexPath) {
    
    
    if let cell = tableView.cellForRow(at: indexPath){ // get the cell configure view
      
      let item = items[indexPath.row]  // change the current check property when is tapped
      item.toggleChecked() //      item.checked = !item.checked

      
//      configureCheckmark(for: cell, at: indexPath)
      configureCheckmark(for: cell, with: item)
    }
    
    tableView.deselectRow(at: indexPath, animated: true)
  }
  
//  func configureCheckmark(for cell: UITableViewCell,
//                          at indexPath: IndexPath) {
//
//    let item = items[indexPath.row]
//    if item.checked {  // isOFF .none
//      cell.accessoryType = .checkmark
//    } else {
//      cell.accessoryType = .none
//    }
//  }
  
  func configureCheckmark(for cell: UITableViewCell,
                          with item: ChecklistItem) {
    if item.checked {
      cell.accessoryType = .checkmark
    } else {
      cell.accessoryType = .none
    }
  }
  
  func configureText(for cell: UITableViewCell, with item: ChecklistItem) {
    let label = cell.viewWithTag(1000) as! UILabel
    label.text = item.text
  }
  
}
