//
//  ContentView.swift
//  NeoTest
//
//  Created by Ringo Wathelet on 2020/07/15.
//

import SwiftUI

struct ContentView: View {
    
    @State var status = ""
    
    var body: some View {
        VStack (spacing: 40) {
            Text("Testing Neo4j bolt connection ....")
            Text(status)
        } .padding().onAppear(perform: loadData)
    }
    
    func loadData() {
        let neotest = NeoTester()
        neotest.doConnect() { isConnected in
            if isConnected {
                status = "is connected"
                print("-----------------> is connected")
            } else {
                status = "could not connect"
                print("----> could not connect")
            }
        }
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
