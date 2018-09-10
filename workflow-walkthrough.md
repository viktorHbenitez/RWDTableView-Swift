# UITableView - CheckList App

### Understanding MVC
### Use model object
### Array to store data


![imagen](../master/assets/sketch2.gif)  

## Change the checkMark with global values

### Steps: 

1. Configure the checkmark in `override func tableView(_ tableView: UITableView,
cellForRowAt indexPath: IndexPath) -> UITableViewCell` use the method `configureCheckmark(for: cell, at: indexPath)`  
2. loop `configureCheckmark(for: cell, at: indexPath)` method and set or unset the checkmark  

```swift

// Configure the checkMark four cells

var row0checked = true
var row1checked = false
var row2checked = true
var row3checked = false
var row4checked = true

override func tableView(_ tableView: UITableView,
                          cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    ...
    
    configureCheckmark(for: cell, at: indexPath)
    return cell
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
    
    // Initial TableViewCell values
    
    if isChecked {  // isOFF .none
      cell.accessoryType = .checkmark
    } else {
      cell.accessoryType = .none
    }
}
```
RESULTS:    
![imagen](../feature-MVC/assets/image1.png)  

## Change the value of the checkMark  when is tapped only 4 rows

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















