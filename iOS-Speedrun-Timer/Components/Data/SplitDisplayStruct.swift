//
//  x.swift
//  iOS-Speedrun-Timer
//
//  Created by Anita Eckardt on 2023-01-07.
//

import Foundation

struct SplitDisplayStruct : Identifiable {
    
    let splitId : Int;
    let splitName : String;
    let timeTook : TimeInterval;
    
    //
    var id: Int {
        self.splitId
    }
}
