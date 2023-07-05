//
//  ViewController.swift
//  UiGang
//
//  Created by Matheus Barbosa on 03/07/23.
//

import UIKit
import Alamofire

class ViewController: UIViewController {

    @IBOutlet weak var pragasTableView: UITableView!
    
    
  var controller: PragasController = PragasController()
  var arrayPragas:[String] = []
  override func viewDidLoad() {
    super.viewDidLoad()
    self.pragasTableView.delegate = self
    self.pragasTableView.dataSource = self
    self.controller.getRequestPragas { response, error in
      if response {
        self.pragasTableView.reloadData()
      }else{
        print(error)
      }
    }
  }
}

//Table View
extension ViewController: UITableViewDelegate, UITableViewDataSource{
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return self.controller.count()
  }
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
    cell.textLabel?.text = self.controller.loadCurrentName(indexPath: indexPath)
    return cell
  }
}