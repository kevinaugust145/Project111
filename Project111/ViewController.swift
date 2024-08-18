//
//  ViewController.swift
//  Project111
//
//  Created by 洪宗燦 on 2024/8/18.
//

import UIKit
enum NameOptions: Int {
    case boyNames, girlNames, filmTitlesm, planetNames
}

class ViewController: UIViewController {
    var array:[String] = []
    @IBOutlet weak var tableViewCell: UITableViewCell!
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        print("\(names)")
        for i in 0...names.count - 1{
                   array.append("\(names[i].firstName) \(names[i].lastName)")
               }
    }


}

extension ViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return array.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
          guard let cell = tableView.dequeueReusableCell(withIdentifier: "\(OptionTableViewCell.self)", for: indexPath) as? OptionTableViewCell else { fatalError("dequeueReusableCell optionTableViewCell failed")
          }
          // 設定 cell 的文本為 array 中對應索引的值
          cell.namesLabel?.text = array[indexPath.row]
          return cell
      }
}
