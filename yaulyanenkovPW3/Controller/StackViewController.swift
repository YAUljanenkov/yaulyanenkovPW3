//
//  StackViewController.swift
//  yaulyanenkovPW3
//
//  Created by Ярослав Ульяненков on 20.10.2021.
//

import UIKit

class StackViewController: UIViewController {
    private var stackView: UIStackView!
    private let alarmManager = (UIApplication.shared.delegate as! AppDelegate).alarmManager
    
    override func viewDidLoad() {
        view.backgroundColor = .white
        self.navigationController?.navigationBar.prefersLargeTitles = true
        setupStackView()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.tabBarController?.title = "Stack"
    }
    
    
    
    func setupStackView() {
        let scroll = UIScrollView()
        view.addSubview(scroll)
        scroll.pin(to: view)
        stackView = UIStackView()
        scroll.addSubview(stackView)
        scroll.pinTop(to: view.safeAreaLayoutGuide.topAnchor)
        scroll.pinBottom(to: view.safeAreaLayoutGuide.bottomAnchor)
        scroll.pin(to: view, .left, .right)
        stackView.pin(to: scroll)
        stackView.setWidth(to: view.bounds.width)
        stackView.axis = .vertical
        stackView.alignment = .fill
        stackView.distribution = .fill
        stackView.spacing = 1
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.backgroundColor = .white
        update()
        print(stackView.arrangedSubviews.count)
    }
    
    func update() {
        for (index, alarm) in alarmManager.alarms.enumerated() {
            let alarmView = AlarmView()
            alarmView.setupAlarmToggle()
            alarmView.alarmId = index
            alarmView.alarmToggle.isOn = alarm.value(forKey: "isActive") as? Bool ?? false
            alarmView.alarmLabel.text = alarm.value(forKey: "time") as? String ?? "00:00"
            stackView.addArrangedSubview(alarmView)
            alarmView.pin(to: stackView, .left, .right)
        }
    }
}
