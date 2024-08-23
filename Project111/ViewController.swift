//
//  ViewController.swift
//  Project111
//
//  Created by 洪宗燦 on 2024/8/18.
//

import UIKit
import Kingfisher
enum NameOptions: Int {
    case boyNames, girlNames, filmTitlesm, planetNames,ShowGraph
}

class ViewController: UIViewController {
    @IBOutlet weak var namesLabel: UILabel!
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

    @IBAction func segmentedControlValueChanged(_ sender: UISegmentedControl) {
        
        array.removeAll() // 清空 array
              // 獲取當前選擇的 Segmented Control 選項
              let option = NameOptions(rawValue: sender.selectedSegmentIndex)!
              // 依照不同的選項，執行不同的動作
              switch option {
              case .girlNames:
                  fetchGirlNames() // 獲取 Girl 的名字
              case .filmTitlesm:
                  fetchFilmTitle() // 獲取電影標題
              case .planetNames:
                  fetchPlanetTitle() // 獲取星球名稱
              case .ShowGraph:
                  fetchGraph() // 獲取星球名稱
              default:
                  // 預設情況下，重新加載 Boy 名字
                  for i in 0...names.count - 1{
                      array.append("\(names[i].firstName) \(names[i].lastName)")
                  }
                  // 在主線程中重新加載 TableView
                  DispatchQueue.main.async {
                      self.tableView.reloadData()
                      print(Thread.isMainThread)
                  }
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
        cell.imageView?.kf.setImage(with: item.artworkUrl100)
          return cell
      }
    
    
    // 獲取 Film 名字的函數
     func fetchFilmTitle(){
          guard let url = URL(string: "https://raw.githubusercontent.com/lebonthe/JSON_API/main/films20Names.json") else { return }
          URLSession.shared.dataTask(with: url) { data, response, error in
              if let data {
                  let decoder = JSONDecoder()
                  do {
                      let nameResponse = try decoder.decode(FilmsTitles.self, from: data)
                      for i in 0...nameResponse.filmTitles.count - 1{
                          self.array.append("\(nameResponse.filmTitles[i].title)" )
                      }
                      DispatchQueue.main.async {
                          self.tableView.reloadData()
                      }
                  } catch {
                      print("Error decoding JSON: \(error)")
                  }
              }
          }.resume()
      }
  
    
     // 獲取 Planet 名字的函數
     func fetchPlanetTitle(){
          guard let url = URL(string: "https://raw.githubusercontent.com/lebonthe/JSON_API/main/planets20Names.json") else { return }
          URLSession.shared.dataTask(with: url) { data, response, error in
              if let data {
                  let decoder = JSONDecoder()
                  do {
                      let nameResponse = try decoder.decode(PlanetNames.self, from: data)
                      for i in 0...nameResponse.planetNames.count - 1{
                          self.array.append("\(nameResponse.planetNames[i].name)" )
                      }
                      DispatchQueue.main.async {
                          self.tableView.reloadData()
                      }
                  } catch {
                      print("Error decoding JSON: \(error)")
                  }
              }
          }.resume()
      }
    
    
    func fetchGirlNames() {
         // 如果 url 正確獲取到網址
         guard let url = URL(string: "https://raw.githubusercontent.com/kevinaugust145/createJSONfile/main/girls20Names.json") else { return }
         // 使用 url 網址產生 URLSession 的連線任務 dataTask function，有三個參數 data, response 與 error
         URLSession.shared.dataTask(with: url) { data, response, error in
             if let data { // 如果有抓到資料
                 let decoder = JSONDecoder() // 創建一個 JSONDecoder 類的實例 decoder
                 do {// 用 decode 方法，將 data 解碼成 GirlNames 類型
                     let nameResponse = try decoder.decode(GirlNames.self, from: data)
                     // 將解碼的名字加入到 array 中
                     for i in 0...nameResponse.names.count - 1{
                         self.array.append("\(nameResponse.names[i].first_name) \(nameResponse.names[i].last_name)")
                     }
                     // 在主線程中重新加載 tableView
                     DispatchQueue.main.async {
                         self.tableView.reloadData()
                     }

                 } catch { // 如果 try 失敗，拋出錯誤
                     print("Error decoding JSON: \(error)")
                 }
             }
         }.resume() // 啟動網路任務
     }
    
    func fetchGraph() {
         // 如果 url 正確獲取到網址
         guard let url = URL(string: "https://raw.githubusercontent.com/kevinaugust145/createJSONfile/main/girls20Names.json") else { return }
         // 使用 url 網址產生 URLSession 的連線任務 dataTask function，有三個參數 data, response 與 error
         URLSession.shared.dataTask(with: url) { data, response, error in
             if let data { // 如果有抓到資料
                 let decoder = JSONDecoder() // 創建一個 JSONDecoder 類的實例 decoder
                 do {// 用 decode 方法，將 data 解碼成 GirlNames 類型
                     let nameResponse = try decoder.decode(GirlNames.self, from: data)
                     // 將解碼的名字加入到 array 中
                     for i in 0...nameResponse.names.count - 1{
                         self.array.append("\(nameResponse.names[i].first_name) \(nameResponse.names[i].last_name)")
                     }
                     // 在主線程中重新加載 tableView
                     DispatchQueue.main.async {
                         self.tableView.reloadData()
                     }

                 } catch { // 如果 try 失敗，拋出錯誤
                     print("Error decoding JSON: \(error)")
                 }
             }
         }.resume() // 啟動網路任務
     }
    
}
#Preview {
    let storyboard = UIStoryboard(name: "Main", bundle: nil)
    let controller = storyboard.instantiateInitialViewController()!
    return controller
    
}
