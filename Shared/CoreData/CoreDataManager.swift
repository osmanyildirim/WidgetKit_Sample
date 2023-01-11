//
//  CoreDataManager.swift
//  WidgetKit_Sample
//
//  Created by Osman Yıldırım
//

import CoreData

final class CoreDataManager {
    static let shared = CoreDataManager()

    let persistentContainer: NSPersistentContainer = {
        let url = FileManager.appGroup.appendingPathComponent("CoreDataModel.sqlite")
        let container = NSPersistentContainer(name: "CoreDataModel")
        container.persistentStoreDescriptions = [NSPersistentStoreDescription(url: url)]
        
        container.loadPersistentStores(completionHandler: { _, error in
            guard let error else { return }
            print(error.localizedDescription)
        })
        return container
    }()

    func fetch() -> (String, String)? {
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Entity")

        do {
            guard let result = try managedObjectContext.fetch(fetchRequest).first as? NSManagedObject, let imageName = result.value(forKey: "imageName") as? String, let species = result.value(forKey: "species") as? String else { return nil }

            return (imageName, species)
        } catch {
            print(error.localizedDescription)
        }
        return nil
    }

    func save(pokemon: Pokemon) {
        clear()

        let entity = NSEntityDescription.entity(forEntityName: "Entity", in: managedObjectContext)!
        let item = NSManagedObject(entity: entity, insertInto: managedObjectContext)

        item.setValue(pokemon.imageName, forKey: "imageName")
        item.setValue(pokemon.speciesText, forKey: "species")
        saveContext()
    }

    func clear() {
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Entity")
        let deleteRequest = NSBatchDeleteRequest(fetchRequest: fetchRequest)

        do {
            try managedObjectContext.execute(deleteRequest)
            saveContext()
        } catch {
            print(error.localizedDescription)
        }
    }
}

extension CoreDataManager {
    var managedObjectContext: NSManagedObjectContext {
        persistentContainer.viewContext
    }

    private func saveContext() {
        managedObjectContext.performAndWait {
            if managedObjectContext.hasChanges {
                do {
                    try managedObjectContext.save()
                } catch {
                    print(error.localizedDescription)
                }
            }
        }
    }
}
