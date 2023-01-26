//
//  FirestoreManager.swift
//  unemployees
//
//  Created by Alex Cho on 2023/01/27.
//

import Foundation
import Firebase

class FirebaseManager: ObservableObject {
    @Published var dogs: [Dog] = []
    
    init(){
        fetchDogs()
    }
    func fetchDogs(){
        dogs.removeAll()
        let db = Firestore.firestore()
        let ref = db.collection("dogs")
        ref.getDocuments { snapshot, error in
            guard error == nil else {
                print(error ?? "Firestore Error")
                return
            }
            if let snapshot = snapshot {
                for document in snapshot.documents{
                    let data = document.data()
                    
                    
                    let id = data["id"] as? String ?? ""
                    let name = data["name"] as? String ?? ""
                    
                    let dog = Dog(id: id, name: name)
                    self.dogs.append(dog)
                    
                    
                }
            }
        }
        print("DEBUG FETCH DOGS")
        print(dogs)
    }
    func addDog(dogBreed: String){
        let db = Firestore.firestore()
        let ref = db.collection("dogs").document(dogBreed)
        ref.setData(["breed" : dogBreed, "id":999]){ error in
            if let error = error {
                print(error)
            }
            
        }
    }
    
}
