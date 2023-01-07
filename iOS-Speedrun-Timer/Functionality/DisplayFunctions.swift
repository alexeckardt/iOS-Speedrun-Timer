//
//  Display Functions.swift
//  iOS-Speedrun-Timer
//
//  Created by Anita Eckardt on 2023-01-06.
//

import Foundation

let secondsAMinute : Double = 60;
let secondsAnHour : Double = secondsAMinute * secondsAMinute; //minute squared haha

func TimeIntervalToTimerStringPercision(secondsElapsed: TimeInterval, percision: Int) -> [String] {
    
    if (secondsElapsed == 0) {
        return ["0.", "0"]
    }
    
    var _secondsElapsed = secondsElapsed;
    var clockString = "";
    var hoursPlaced = false;
    
    //Hour
    if (_secondsElapsed >= secondsAnHour) {
        
        //Get the Hours that have elapsed
        let hours : Int = Int(_secondsElapsed/secondsAnHour)
        
        //Add To String
        clockString += String(format: "%d", hours) + ":"
        
        //Update Seconds
        _secondsElapsed -= Double(hours) * secondsAnHour;
        hoursPlaced = true;
    }
    
    //Minutes (If HOUR was placed, must place minutes, (avoid wierd display issue if exactly an hour)
    if (secondsElapsed >= secondsAMinute || hoursPlaced) {
        
        //Get the Minutes that have elapsed
        let minutes : Int = Int(_secondsElapsed/secondsAMinute)
        
        //Add To String
        clockString += String(format: "%02d", minutes) + ":"
        
        //Update Seconds
        _secondsElapsed -= Double(minutes) * secondsAMinute;
    }
         
    //Should Be Below 60 now; Show Seconds
    clockString += String(format: "%02d", Int(_secondsElapsed)) + "."
    
    //
    //
    //Round The Time Under A Seconds
    let frac : Double = secondsElapsed.truncatingRemainder(dividingBy: 1);
    let multiplier = pow(10, Double(percision+1))
    
    let subSeconds : Int = Int(frac * multiplier)
      
    //
    //
    //
    
    return [clockString, String(format: "%04d", subSeconds)]
    
}

//
//
//

func TimeIntervalToTimerString(secondsElapsed: TimeInterval) -> [String] {
    return TimeIntervalToTimerStringPercision(secondsElapsed: secondsElapsed, percision: 3)
}
