//
//  Display Functions.swift
//  iOS-Speedrun-Timer
//
//  Created by Anita Eckardt on 2023-01-06.
//

import Foundation

let secondsAMinute : Double = 60;
let secondsAnHour : Double = secondsAMinute * secondsAMinute; //minute squared haha

func TimeIntervalToTimerString(secondsElapsed: TimeInterval) -> [String] {
    
    var _secondsElapsed = secondsElapsed;
    var clockString = "";
    var hoursPlaced = false;
    
    //Hour
    if (_secondsElapsed >= secondsAnHour) {
        
        //Get the Hours that have elapsed
        let hours : Double = floor(_secondsElapsed/secondsAnHour)
        
        //Add To String
        clockString += String(format: "%.0f", hours) + ":"
        
        //Update Seconds
        _secondsElapsed -= hours * secondsAnHour;
        hoursPlaced = true;
    }
    
    //Minutes (If HOUR was placed, must place minutes, (avoid wierd display issue if exactly an hour)
    if (secondsElapsed >= secondsAMinute || hoursPlaced) {
        
        //Get the Minutes that have elapsed
        let minutes : Double = floor(_secondsElapsed/secondsAMinute)
        
        //Add To String
        clockString += String(format: "%.0f", minutes) + ":"
        
        //Update Seconds
        _secondsElapsed -= minutes * secondsAMinute;
    }
         
    //Should Be Below 60 now; Show Seconds
    clockString += String(format: "%.0f", floor(_secondsElapsed)) + "."
    
    //
    //
    //Round The Time Under A Seconds
    var frac : Double = secondsElapsed.truncatingRemainder(dividingBy: 1);
    frac = floor(frac * 1000)
      
    //
    //
    //
    
    return [clockString, String(format: "%.0f", frac)]
}
