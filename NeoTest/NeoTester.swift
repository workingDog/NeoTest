//
//  NeoTester.swift
//  NeoTest
//
//  Created by Ringo Wathelet on 2020/07/15.
//

import Foundation
import Theo


class NeoTester {
    
    let user: String
    let psw: String
    let host: String
    let port: Int
    
    let graphDB: BoltClient?
    
    init(host: String = "localhost", port: Int = 7687, user: String = "neo4j", psw: String = "neo4j357") {
        self.user = user
        self.psw = psw
        self.host = host
        self.port = port
        self.graphDB = try? BoltClient(hostname: host, port: port,
                                       username: user, password: psw, encrypted: true)
        print("---> NeoTester init graphDB is: \(graphDB.debugDescription)")
    }
    
    func doConnect(completion: @escaping (Bool) -> ()) {
        guard let theo = self.graphDB else {
            print("---> NeoTester connect graphDB is nil")
            return
        }
        print("---> NeoTester trying to connect ...")
        theo.connect() { result in
            switch result {
            case let .failure(error):
                print("=====> Failed connecting with error: \(error)")
                completion(false)
            case let .success(isConnected):
                if !isConnected {
                    print("===> Error, could not connect!")
                } else {
                    print("-------------------> connected <-------------------")
                }
                completion(isConnected)
            }
        }
    }
    
}
