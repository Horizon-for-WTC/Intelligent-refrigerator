//
//  ContentView.swift
//  Intelligent refrigerator
//
//  Created by RemiliaScarlet on 2021/1/26.
//

import SwiftUI
import SwiftUIX
import CoreData

struct ContentView: View {
    
    init() {
        print("Init Start!!!")
        //you init code here
        print("Init down!!!")
    }
    
    var body: some View {        
        ZStack{
            VStack{
                Text("123")
            }
        }
    }
    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            //ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
            ContentView()
        }
    }
}
