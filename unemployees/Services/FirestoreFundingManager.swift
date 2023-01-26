//
//  FirestoreFundingManager.swift
//  unemployees
//
//  Created by Alex Cho on 2023/01/27.
//

import Foundation
import Firebase

class FirestoreFundingManager: ObservableObject {
    @Published var fundings: [Funding] = []
    
    init(){
        fetchFunding()
    }
    func fetchFunding(){
        fundings.removeAll()
        let db = Firestore.firestore()
        let ref = db.collection("fundings")
        
        ref.getDocuments { snapshot, error in
            guard error == nil else {
                print(error ?? "Firestore Error")
                return
            }
            if let snapshot = snapshot {
                for document in snapshot.documents{
                    let data = document.data()
                    
                    
                    let currentAmount = data["currentAmount"] as? Int ?? 0
                    let targetAmount = data["targetAmount"] as? Int ?? 0
                    let title = data["title"] as? String ?? ""
                    let id = data["id"] as? String ?? ""
                    let media = data["media"] as? String ?? ""
                    print(data)
                    let funding = Funding(title: title, currentAmount: currentAmount, targetAmount: targetAmount, id: id,media: media)
                    self.fundings.append(funding)
                    
                    
                }
            }
        }
    }
//    func addDog(dogBreed: String){
//        let db = Firestore.firestore()
//        let ref = db.collection("dogs").document(dogBreed)
//        ref.setData(["breed" : dogBreed, "id":999]){ error in
//            if let error = error {
//                print(error)
//            }
//
//        }
//    }
    
}
