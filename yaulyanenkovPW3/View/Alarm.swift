//
//  Alarm.swift
//  yaulyanenkovPW3
//
//  Created by Ярослав Ульяненков on 20.10.2021.
//

import UIKit

class Alarm : UICollectionViewCell {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupAlarmToggle();
        self.addBorders(edges: .bottom, color: .black, width: 1)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    
    private func setupAlarmToggle() {
            let alarmToggle = UISwitch()
            self.addSubview(alarmToggle)
            alarmToggle.translatesAutoresizingMaskIntoConstraints = false
            alarmToggle.pinTop(to: self, 10)
            alarmToggle.pinRight(to: self, 20)
            
            let alarmLabel = UILabel()
            self.addSubview(alarmLabel)
            alarmLabel.text = "04:20"
            alarmLabel.translatesAutoresizingMaskIntoConstraints = false
            alarmLabel.pinTop(to: self, 10)
            alarmLabel.pinLeft(to: self, 10)
        }
}
