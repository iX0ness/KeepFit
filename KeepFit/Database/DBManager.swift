//
//  DBManager.swift
//  KeepFit
//
//  Created by Levchuk Misha on 06/11/2018.
//  Copyright © 2018 Levchuk Misha. All rights reserved.
//

import Foundation
import RealmSwift

class DBManager {

    private var database: Realm
    static let sharedInstance = DBManager()



    private init() {
        database = try! Realm()
        print(Realm.Configuration.defaultConfiguration.fileURL!)
    }


    func saveObjectInDB<T: Object>(_ model: T, completion: @escaping () -> (), failure: @escaping (String) -> ()) {
        do {
            try database.write {
                database.add(model, update: true)
                completion()
            }
        } catch let error {
            failure(error.localizedDescription)
        }
    }

    func getDataFromDB() -> Results<Exercise> {
        let results: Results<Exercise> = database.objects(Exercise.self)
        print("DB size: ", results.count)
        for ex in results {
            print(ex.name)
            print(ex.imagePath)
        }
        return results
    }


}

extension UIImage {
    func saveInLocalStorage(imageName: String) -> String? {
        do {
            let documentsURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
            let fileURL = documentsURL.appendingPathComponent("\(imageName).jpg")

            guard !FileManager.default.fileExists(atPath: fileURL.absoluteString) else {
                return nil
            }

            guard let data = self.jpegData(compressionQuality: 1.0) ?? self.pngData() else {
                return nil
            }
            try data.write(to: fileURL)
            return "\(imageName).jpg"
        } catch { }
        return nil
    }
}
