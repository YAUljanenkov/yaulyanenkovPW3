//
//  TableViewController.swift
//  yaulyanenkovPW3
//
//  Created by Ярослав Ульяненков on 20.10.2021.
//

import UIKit

class TableViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    private let cellId = "Alarm"
    private let alarmManager = (UIApplication.shared.delegate as! AppDelegate).alarmManager
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        self.tabBarController?.title = "Table"
        self.navigationController?.navigationBar.prefersLargeTitles = true
        setupTableView()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        self.tabBarController?.title = "Table"
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath:
                   IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(
            withIdentifier: cellId,
            for: indexPath
        ) as? AlarmViewCell
        let alarmData = alarmManager.alarms[indexPath.row]
        cell?.alarmToggle.isOn = alarmData.value(forKey: "isActive") as? Bool ?? false
        cell?.alarmLabel.text = "\(alarmData.value(forKey: "time") ?? "00:00")"
        cell?.setUpCell()
        return cell ?? UITableViewCell()
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection
                   section: Int) -> Int {
        
        alarmManager.alarms.count
        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        1
    }
    
    func setupTableView() {
        let table = UITableView()
        table.register(AlarmViewCell.self, forCellReuseIdentifier: cellId)
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

