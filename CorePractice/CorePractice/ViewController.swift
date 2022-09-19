//
//  ViewController.swift
//  CorePractice
//
//  Created by Spencer Hurd on 9/18/22.
//

import UIKit

class ViewController: UIViewController {

    let tableView: UITableView = {
        let table = UITableView()
        table.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        return table
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableView.dataSource = self
        tableView.delegate = self
        view.addSubview(tableView)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.frame = view.bounds
    }

}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        27
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = "Insert text on row: \(indexPath.row)"
        // TODO: imageView is deprecated, find replacement
        cell.imageView?.image = UIImage(systemName: "star")
        cell.imageView?.tintColor = .systemYellow
        return cell
    }
}

extension ViewController: UITableViewDelegate {}
