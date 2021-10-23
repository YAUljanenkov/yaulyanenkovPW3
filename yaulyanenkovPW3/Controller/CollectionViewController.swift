//
//  CollectionViewController.swift
//  yaulyanenkovPW3
//
//  Created by Ярослав Ульяненков on 20.10.2021.
//

import UIKit

class CollectionViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    private var collection: UICollectionView?
    private let alarmManager = (UIApplication.shared.delegate as! AppDelegate).alarmManager
    private let cellId = "Alarm"
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! AlarmViewCollection
        
        let alarmData = alarmManager.alarms[indexPath.row]
        
        cell.alarmToggle.isOn = alarmData.value(forKey: "isActive") as? Bool ?? false
        cell.alarmLabel.text = "\(alarmData.value(forKey: "time") ?? "00:00")"
        cell.layer.masksToBounds = true
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize
    {
        return CGSize(width: Double(view.bounds.width), height: 60.0)
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return alarmManager.alarms.count
    }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(indexPath.row)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        self.tabBarController?.title = "Collection"
        self.navigationController?.navigationBar.prefersLargeTitles = true
        setupCollectionView()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        self.tabBarController?.title = "Collection"
    }
    
    func setupCollectionView() {
        let layoutFlow = UICollectionViewFlowLayout()
        layoutFlow.sectionInset = UIEdgeInsets(top: 5, left: 0,
                                               bottom: 10, right: 0)
        layoutFlow.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
        layoutFlow.minimumInteritemSpacing = 0
        layoutFlow.minimumLineSpacing = 0
        let collection = UICollectionView(frame: .zero,
                                          collectionViewLayout: layoutFlow)
        collection.dataSource = self
        collection.delegate = self
        collection.showsVerticalScrollIndicator = true
        view.addSubview(collection)
        collection.register(AlarmViewCollection.self, forCellWithReuseIdentifier: cellId)
        collection.pinTop(to: view.safeAreaLayoutGuide.topAnchor)
        collection.pinBottom(to: view.safeAreaLayoutGuide.bottomAnchor)
        collection.pin(to: view, .left, .right)
        collection.backgroundColor = .white
        self.collection = collection
    }
}
