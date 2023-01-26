//
//  ContentView.swift
//  norithon
//
//  Created by Alex Cho on 2023/01/26.
//

import SwiftUI
import RealityKit
import Firebase
struct ContentView : View {
    var body: some View {
        
        
        @State private var 
        //        ARViewContainer().edgesIgnoringSafeArea(.all)
        
        //login or register here
        //if logged in go to home
        //else go to register
        HomeView().environmentObject(FirebaseManager())}
    
    
    
    
    
    
}











struct ARViewContainer: UIViewRepresentable {
    
    func makeUIView(context: Context) -> ARView {
        
        let arView = ARView(frame: .zero)
        
        // Load the "Box" scene from the "Experience" Reality File
        let boxAnchor = try! Experience.loadBox()
        
        // Add the box anchor to the scene
        arView.scene.anchors.append(boxAnchor)
        
        return arView
        
    }
    
    func updateUIView(_ uiView: ARView, context: Context) {}
    
}

#if DEBUG
struct ContentView_Previews : PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif
