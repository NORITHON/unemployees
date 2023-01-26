//
//  HomeView.swift
//  unemployees
//
//  Created by Alex Cho on 2023/01/26.
//
import SwiftUI
import Firebase

struct HomeView: View {
    @EnvironmentObject var firestoreFundingManager: FirestoreFundingManager
//    @State private var showPopUp = false
    init(){
    }
    var body: some View {
        
        NavigationView {
            List(firestoreFundingManager.fundings, id: \.self){ funding in
                NavigationLink(funding.title) {
                    x()
                }
                HStack{
                    Text("\(funding.title)")
                    Text("\(funding.currentAmount)")
                    Text("\(funding.targetAmount)")
                }.onTapGesture {
                    //navigate to detail
                }
                
            }.navigationTitle("Fundings")
                .navigationBarItems(trailing: Button(action: {
                    //add dogs
//                    showPopUp.toggle()
                }, label: {
//                    Image(systemName: "plus")
                }))
//                .sheet(isPresented: $showPopUp) {
//                    //pop up
//                }
        }
    }
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView().environmentObject((FirestoreFundingManager()))
    }
}
