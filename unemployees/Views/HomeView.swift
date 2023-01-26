import SwiftUI
import Firebase

struct HomeView: View {
    @EnvironmentObject var firebaseManager: FirebaseManager
//    @State private var showPopUp = false
    init(){
        
    }
    var body: some View {
        NavigationView {
            List(firebaseManager.dogs, id: \.name){dog in
                Text("\(dog.name)")
            }.navigationTitle("Dogs")
                .navigationBarItems(trailing: Button(action: {
                    //add dogs
//                    showPopUp.toggle()
                }, label: {
                    Image(systemName: "plus")
                }))
//                .sheet(isPresented: $showPopUp) {
//                    //pop up
//                }
        }
    }
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView().environmentObject(FirebaseManager())
    }
}
