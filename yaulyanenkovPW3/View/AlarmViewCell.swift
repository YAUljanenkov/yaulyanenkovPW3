//
//  Alarm.swift
//  yaulyanenkovPW3
//
//  Created by Ярослав Ульяненков on 20.10.2021.
//

import UIKit

class AlarmViewCell : UITableViewCell {
    private let alarmManager = (UIApplication.shared.delegate as! AppDelegate).alarmManager
    
    let alarmLabel: UILabel = {
        let alarmLabel = UILabel()
        alarmLabel.text = "04:20"
        alarmLabel.translatesAutoresizingMaskIntoConstraints = false
        
        return alarmLabel
    }()
    
    let alarmToggle: UISwitch = {
        let alarmToggle = UISwitch()
        alarmToggle.addTarget(
             self,
             action: #selector(alarmToggleSwitched),
             for: .valueChanged
         )
        alarmToggle.translatesAutoresizingMaskIntoConstraints = false
        return alarmToggle
    }()
    
    func setUpCell() {
        setHeight(to: 60)
        setupAlarmToggle();
        self.addBorders(edges: .bottom, color: .black, width: 1)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setUpCell()
    }
    
    var alarmId = 0
    
    
    private func setupAlarmToggle() {
        self.addSubview(alarmToggle)
        self.addSubview(alarmLabel)
        alarmLabel.pinTop(to: self, 10)
        alarmLabel.pinLeft(to: self, 10)
        alarmToggle.pinTop(to: self, 10)
        alarmToggle.pinRight(to: self, 20)
    }

    @objc
     func alarmToggleSwitched(_ sender: UISwitch) {
         alarmManager.alarms[alarmId].setValue( sender.isOn, forKey: "isActive")
         alarmManager.saveContext()
     }
    
    override func prepareForReuse() {
        super.prepareForReuse()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
}
