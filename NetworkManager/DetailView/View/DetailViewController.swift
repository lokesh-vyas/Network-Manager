//
//  DetailViewController.swift
//  NetworkManager
//
//  Created by Lokesh Vyas on 16/02/22.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var detailTableView: UITableView!
    
    var articleData : Article?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.registerTableViewCells()
        // Do any additional setup after loading the view.
    }
    
    private func registerTableViewCells() {
        let textFieldCell = UINib(nibName: "DetailViewCell",
                                  bundle: nil)
        self.detailTableView.register(textFieldCell,
                                forCellReuseIdentifier: "DetailViewCell")
        self.detailTableView.dataSource = self
        self.detailTableView.delegate = self
        detailTableView.rowHeight = 350
        detailTableView.estimatedRowHeight = 500
        self.detailTableView.reloadData()
    }
}

extension DetailViewController:UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "DetailViewCell", for: indexPath) as! DetailViewCell
        cell.articleData = self.articleData
        return cell
    }
}
