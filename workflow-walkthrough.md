# UITableView - CheckList App

### Understanding MVC
### Use model object
### Array to store data


![imagen](../master/assets/sketch2.gif)  

## Change the checkmark with global values  (Refactor)

### Steps: 

1. Configure the checkmark in `override func tableView(_ tableView: UITableView,
cellForRowAt indexPath: IndexPath) -> UITableViewCell` 
1.1  configure the checkmark `configureCheckmark(for: cell, with: item)` front  
1. 2 configure the text label `configureText(for: cell, with: item)`  
  

```swift

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
  
  // ******* old configure checkmark
  
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
  
}
```
RESULTS:    
![imagen](../feature-MVC/assets/image1.png)  

## Change the value of the checkMark  when is tapped

### Steps: 
1. When is tapped the cell in `override func tableView(_ tableView: UITableView,
didSelectRowAt indexPath: IndexPath)` change the value of the row value property.  
2. Configure again the check `mark configureCheckmark(for: cell, at: indexPath)`  


```swift
  override func tableView(_ tableView: UITableView,
                          didSelectRowAt indexPath: IndexPath) {
    

    // 1. tapped the cell and change the value of bool
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
      
      // 2. Configure again the checkMark
      configureCheckmark(for: cell, at: indexPath)
      
    }
    
    tableView.deselectRow(at: indexPath, animated: true)
  }
```















