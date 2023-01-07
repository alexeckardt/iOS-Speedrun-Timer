//
//  RightArrow.swift
//  iOS-Speedrun-Timer
//
//  Created by Anita Eckardt on 2023-01-06.
//

import SwiftUI

struct RightArrow: View {
    var body: some View {
        
        Image(systemName: "chevron.right")
            .padding(.trailing)
        
    }
}

struct RightArrow_Previews: PreviewProvider {
    static var previews: some View {
        RightArrow()
    }
}
