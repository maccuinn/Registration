//
//  AppDelegate.swift
//  Registration
//
//  Created by April Hall on 2018-05-30.
//  Copyright © 2018 April Hall. All rights reserved.
//

import UIKit
import CoreData

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        let context = persistentContainer.viewContext
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Club")
        request.returnsObjectsAsFaults = false
        
        do {
            let result = try context.fetch(request) as? [NSManagedObject]
            if result?.count ?? 0 == 0 {
                addTestData()
            }
        } catch {
            print("Could not load Test Data")
        }
        return true
    }
    
    func addTestData() {
        let context = persistentContainer.viewContext
        
        let entity2 = NSEntityDescription.entity(forEntityName: "Club", in: context)
        let club1 = NSManagedObject(entity: entity2!, insertInto: context)
        let club2 = NSManagedObject(entity: entity2!, insertInto: context)
        let club3 = NSManagedObject(entity: entity2!, insertInto: context)
        let club4 = NSManagedObject(entity: entity2!, insertInto: context)
        let club5 = NSManagedObject(entity: entity2!, insertInto: context)
        
        club1.setValue("Langley", forKey: "clubName")
        club2.setValue("Portland", forKey: "clubName")
        club3.setValue("Washington", forKey: "clubName")
        club4.setValue("Yakima", forKey: "clubName")
        club5.setValue("Bolder", forKey: "clubName")
        let clubs = [club1, club2, club3, club4, club5]
        
        for club in clubs {
            let entity = NSEntityDescription.entity(forEntityName: "Event", in: context)
            let event1 = NSManagedObject(entity: entity!, insertInto: context)
            let event2 = NSManagedObject(entity: entity!, insertInto: context)
            let event3 = NSManagedObject(entity: entity!, insertInto: context)
            let event4 = NSManagedObject(entity: entity!, insertInto: context)
            let event5 = NSManagedObject(entity: entity!, insertInto: context)
            
            event1.setValue("Western Grand", forKey: "eventName")
            event2.setValue("States Race", forKey: "eventName")
            event3.setValue("Region Race", forKey: "eventName")
            event4.setValue("Club Race", forKey: "eventName")
            event5.setValue("Points Race", forKey: "eventName")
            let events = [event1, event2, event3, event4, event5]
            
            let c = club as! Club
            c.events = []
            
            for event in events {
            //    //event.setValue(club, forKey: "club")
                (event as! Event).club = club as? Club
            }

            
            //club.mutableSetValue(forKey: "club").addObjects(from: events)
            
            
        }
        do {
            try context.save()
        } catch {
            print("Could not save test data")
        }
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
        // Saves changes in the application's managed object context before the application terminates.
        self.saveContext()
    }

    // MARK: - Core Data stack

    lazy var persistentContainer: NSPersistentContainer = {
        /*
         The persistent container for the application. This implementation
         creates and returns a container, having loaded the store for the
         application to it. This property is optional since there are legitimate
         error conditions that could cause the creation of the store to fail.
        */
        let container = NSPersistentContainer(name: "Registration")
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

    // MARK: - Core Data Saving support

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

