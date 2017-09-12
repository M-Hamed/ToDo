//
//  ToDoViewController.swift
//  ToDo
//
//  Created by Mohamed Hamed on 9/12/17.
//  Copyright © 2017 Mohamed Hamed. All rights reserved.
//

import UIKit
import RealmSwift

class ToDoViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTableView()
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addTapped))
    }
    
    @objc func addTapped(sender: UIBarButtonItem) {
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
}

extension ToDoViewController: UITableViewDelegate, UITableViewDataSource {
    
    // MARK: TableView
    func configureTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        registerCells()
        tableView.estimatedRowHeight = 100
        tableView.rowHeight = UITableViewAutomaticDimension
    }
    
    func registerCells() {
        let cells : [UITableViewCell.Type] = [ToDoTableViewCell.self]
        cells.forEach { cell in
            let cellName = String(describing: cell.self)
            let nib = UINib(nibName: cellName, bundle: nil)
            tableView?.register(nib, forCellReuseIdentifier: cellName)
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1 //TODO: sections by date //Today // tomorrow //etc
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellName = String(describing: ToDoTableViewCell.self)
        let cell  = tableView.dequeueReusableCell(withIdentifier: cellName) as! ToDoTableViewCell
        return cell
    }
    
}
