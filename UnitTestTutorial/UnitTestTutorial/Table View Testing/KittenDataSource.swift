//
//  KittenDataSource.swift
//  UnitTestTutorial
//
//  Created by Afnan Khan on 9/28/19.
//  Copyright © 2019 Afnan Khan. All rights reserved.
//

import Foundation
import UIKit


class KittenDataSource : NSObject, UITableViewDataSource   {
    
    var kittens = [Kitten]()

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return kittens.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = kittens[indexPath.row].name
         
        cell.accessoryType = ( kittens[indexPath.row].isAdoptable) ? .disclosureIndicator : .none
        
        return cell
    }
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return kittens.count > 0 ? 1 : 0
    }
    
}
