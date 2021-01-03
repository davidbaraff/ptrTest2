//
//  AppDelegate.swift
//  sampleApp
//
//  Created by David Baraff on 1/3/19.
//  Copyright © 2019 Pixar. All rights reserved.
//

import Cocoa
import ptrTest2

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {

    @IBOutlet weak var window: NSWindow!

    func do1() {
        let then = Date()
        let rt = RT()
        let refVal = rt.call_that_copies()
        for _ in 0...5000 {
            for _ in 0...5000 {
                for _ in 0...10 {
                    if (rt.call_that_copies() != refVal) {
                        fatalError("oops")
                    }
                    
                }
            }
        }
        print("call_that_copies: ", Date().timeIntervalSince(then))
    }
    
    func do2() {
        let then = Date()
        var rt = RT()
        let refVal = rt.mutating_call_that_copies()
        for _ in 0...5000 {
            for _ in 0...5000 {
                for _ in 0...10 {
                    if (rt.mutating_call_that_copies() != refVal) {
                        fatalError("oops")
                    }
                }
            }
        }
        print("mutating_call_that_copies: ", Date().timeIntervalSince(then))
    }

    func applicationDidFinishLaunching(_ aNotification: Notification) {
        DispatchQueue.global().async {
            self.do1()
            self.do2()
            exit(0)
        }
    }

    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }
}

