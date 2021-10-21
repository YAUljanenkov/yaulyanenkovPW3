//
//  TableViewController.swift
//  yaulyanenkovPW3
//
//  Created by Ярослав Ульяненков on 20.10.2021.
//

import UIKit

class TableViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .lightGray
        setupTableView()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath:
                   IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(
            withIdentifier: "eyeCell",
            for: indexPath
        ) as? EyeCell
        
        cell?.setupEye()
        return cell ?? UITableViewCell()
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection
                   section: Int) -> Int {
        300
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        1
    }
    
    func setupTableView() {
        let table = UITableView()
        table.register(EyeCell.self, forCellReuseIdentifier: "eyeCell")
        table.delegate = self
        table.backgroundColor = .white
        table.translatesAutoresizingMaskIntoConstraints = false
        table.dataSource = self
        view.addSubview(table)
        table.pinTop(to: view.safeAreaLayoutGuide.topAnchor)
        table.pinBottom(to: view.safeAreaLayoutGuide.bottomAnchor)
        table.pin(to: view, .left, .right)
        
    }
    
}

