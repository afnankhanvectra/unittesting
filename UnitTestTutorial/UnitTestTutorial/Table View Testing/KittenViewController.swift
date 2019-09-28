//
//  KittenViewController.swift
//  UnitTestTutorial
//
//  Created by Afnan Khan on 9/28/19.
//  Copyright © 2019 Afnan Khan. All rights reserved.
//

import UIKit


//if a ‘URLOpener’ is a value type or a reference type and ‘===’ is only for comparing reference types so if say, two structs conformed to URLOpener then their identities (location in memory) could not be compared. So adding class
protocol URLOpener  : class {
    func openURL(_ url: URL) -> Bool
}

class KittenViewController: UIViewController, UITableViewDelegate {

 
    private var dataSource = KittenDataSource()

    @IBOutlet weak var tableView: UITableView! {
        didSet {
            tableView.dataSource = dataSource
        }
    }
    
    var opener: URLOpener = UIApplication.shared
        
    

    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        for num in 0..<100 {
            let kitten = Kitten(name: "Kitten\(num)")
            kitten.isAdoptable = arc4random_uniform(50) % 3 == 0
            dataSource.kittens.append(kitten)
        }
        tableView.reloadData()

  }
    
    func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
        return  dataSource.kittens[indexPath.row].isAdoptable ? indexPath : nil
            
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let kittenName = dataSource.kittens[indexPath.row].name
        guard let url = URL(string: "https://www.google.com/search?q=\(kittenName)") else {
            return
        }
        
        opener.openURL(url)
    }
    

     

}



// Extension for open URL

extension UIApplication: URLOpener {
    
}
