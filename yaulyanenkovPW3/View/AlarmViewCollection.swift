//
//  Alarm.swift
//  yaulyanenkovPW3
//
//  Created by Ярослав Ульяненков on 20.10.2021.
//

import UIKit

class AlarmViewCollection : UICollectionViewCell {
    
    let alarmLabel: UILabel = {
        let alarmLabel = UILabel()
        alarmLabel.text = "04:20"
        alarmLabel.translatesAutoresizingMaskIntoConstraints = false
        
        return alarmLabel
    }()
    
    let alarmToggle: UISwitch = {
        let alarmToggle = UISwitch()
        alarmToggle.translatesAutoresizingMaskIntoConstraints = false
        return alarmToggle
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupAlarmToggle();
        self.addBorders(edges: .bottom, color: .black, width: 1)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func setupAlarmToggle() {
        self.addSubview(alarmToggle)
        self.addSubview(alarmLabel)
        alarmLabel.pinTop(to: self, 10)
        alarmLabel.pinLeft(to: self, 10)
        alarmToggle.pinTop(to: self, 10)
        alarmToggle.pinRight(to: self, 20)
    }

}
