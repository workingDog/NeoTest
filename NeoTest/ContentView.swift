//
//  ContentView.swift
//  NeoTest
//
//  Created by Ringo Wathelet on 2020/07/15.
//

import SwiftUI


struct ContentView: View {
    
    @State var status = ""
    @State var host = "localhost"
    @State var port = "7687"
    @State var user = "neo4j"
    @State var psw = "neo4j"
    
    var body: some View {
        VStack (spacing: 40) {
            TextField("host", text: $host)
            TextField("port", text: $port)
            TextField("user", text: $user)
            TextField("psw", text: $psw)
            VStack {
                Button(action: {doConnect()}) {
                    Image(systemName: "bolt.circle")
                        .resizable()
                        .frame(width: 70, height: 70)
                        .foregroundColor(.blue)
                }
                Text("connect").foregroundColor(.blue).font(.caption)
            }
            Text(status).foregroundColor(.red)
        }.textFieldStyle(RoundedBorderTextFieldStyle())
        .frame(width: 300)
        .padding()
    }
    
    func doConnect() {
        let portInt = Int(port) ?? 7687
        let neotest = NeoTester(host: host, port: portInt, user: user, psw: psw)
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
