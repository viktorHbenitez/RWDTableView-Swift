//
//  ChecklistItem.swift
//  Checklists
//
//  Created by Victor Hugo Benitez Bosques on 09/09/18.
//  Copyright © 2018 Razeware. All rights reserved.
//

import Foundation
import UIKit

class ChecklistItem {
  
  var text = ""
  var checked = false
  
  
  func toggleChecked() {
    self.checked = !self.checked
  }

  
}

