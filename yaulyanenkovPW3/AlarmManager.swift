//
//  AlarmManager.swift
//  yaulyanenkovPW3
//
//  Created by Ярослав Ульяненков on 22.10.2021.
//
import UIKit
import CoreData

class AlarmManager {
    var alarms = [NSManagedObject]()
    
    
    init() {
        do {
            let managedContext = persistentContainer.viewContext
            
            let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName:"Alarm")
            
            if let results = try managedContext.fetch(fetchRequest) as? [NSManagedObject] {
                alarms = results
            }
            
        } catch {
            print(error)
        }
        
        if(alarms.isEmpty) {
            for _ in 1...5 {
                let hour = Int.random(in: 0..<23)
                let minute = Int.random(in: 0..<59)
                var hourString: String, minuteString: String
                if hour < 10 {
                    hourString = "0\(hour)"
                } else {
                    hourString = "\(hour)"
                }
                if minute < 10 {
                    minuteString = "0\(minute)"
                } else {
                    minuteString = "\(minute)"
                }
                addAlarm(time: "\(hourString):\(minuteString)", isActive: false)
            }
        }
        
        
    }
    func addAlarm(time: String, isActive: Bool) {
        let managedContext = persistentContainer.viewContext
        
        let entity =  NSEntityDescription.entity(
            forEntityName: "Alarm",
            in: managedContext
        )
        
        let alarm = NSManagedObject(
            entity: entity!,
            insertInto:managedContext
        )
        
        alarm.setValue(time, forKey: "time")
        alarm.setValue(isActive, forKey: "isActive")
        
        alarms.append(alarm)
        saveContext()
    }
    
    lazy var persistentContainer: NSPersistentContainer = {
        /*
         The persistent container for the application. This implementation
         creates and returns a container, having loaded the store for the
         application to it. This property is optional since there are legitimate
         error conditions that could cause the creation of the store to fail.
        */
        let container = NSPersistentContainer(name: "AlarmModel")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                 
                /*
                 Typical reasons for an error here include:
                 * The parent directory does not exist, cannot be created, or disallows writing.
                 * The persistent store is not accessible, due to permissions or data protection when the device is locked.
                 * The device is out of space.
                 * The store could not be migrated to the current model version.
                 Check the error message to determine what the actual problem was.
                 */
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()
    
    func saveContext () {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
}
