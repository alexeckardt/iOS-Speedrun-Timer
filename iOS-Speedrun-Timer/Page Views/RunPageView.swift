//
//  RunTimer.swift
//  iOS-Speedrun-Timer
//
//  Created by Anita Eckardt on 2023-01-06.
//

import SwiftUI

struct RunPageView: View {
    
    @Environment(\.presentationMode) var mode;
    
    //Detect App Close
    @Environment(\.scenePhase) var scenePhase
    @State private var isActive = true
    @State private var dateAppClosed : Date = Date();
    
    //Timer
    @State private var timerRunning = false;
    @State private var timeLastUpdated : Date = Date();
    @State private var storedTimerTime : TimeInterval = 0.0;
    @State private var timeLastSplitCreated : TimeInterval = 0;
    @State private var timeStep = 0.01
    let timer = Timer.publish(every: 0.01, on: .main, in: .common).autoconnect()
    
    //Splits
    @State private var splitsHit = 0;
    @State private var displaySplits : [SplitDisplayStruct] = []
    @State private var totalSplitCount = 10; //testrn
    @State private var lockSplitButton = false;
    
    //Size
    private var buttonSize : CGFloat = 20;
    
    //Define Common Button Colours
    let g = Color(.systemGray)
    let b = Color(.systemBlue)
    
    var body: some View {
        ZStack {
            
            //Timer
            timeInfo
            
            footer
            
            //
            //Tap Gestures
            VStack {
                
                //header
                header
                
                //push to top
                Spacer()
            }
        }
        //Update Timer
        .onReceive(timer) { _ in
            
            TimerUpdate()
            
        }
        
        //Update If App Closes
        .onChange(of: scenePhase) { newPhase in
            
            TimerUpdateOnSceneUpdate(newPhase: newPhase)
            
        }
    }
}

//
//
//
//
//

extension RunPageView {
    
    var header: some View {
        
        HStack {
            backButton
            Spacer()
        }
        
    }
    
    var backButton: some View {
        
        //Back Arrow Button
        Button {
            
            //Exit the Current Page, Return to previous view
            mode.wrappedValue.dismiss()
            
        } label: {
            //Image
            RunSmallButtonLabelView(buttonSize: buttonSize,
                                    buttonLabelImage: "arrow.left",
                                    backgroundCol: timerRunning ? g : b)
            
        }
        .padding(.leading)
        
        
    }
    
    //
    //
    //
    
    var timeInfo : some View {
        
        VStack {
            
            //Get the Time Elapsed
            TimeView(timeElapsed: storedTimerTime)
         
            ScrollView {
                splitInfo
            }
            .frame(height: 200)
            
        }
        
    }
    
    //
    //
    
    var splitInfo : some View {
        
        LazyVStack {
            
            //Go Over the Tabs
            ForEach(displaySplits) { splitInfo in
                
                //Show the Milestone
                TimerSplitView(splitInfo: splitInfo)
                
            }
            
        }
    }
    
    //
    //
    //
    
    var footer : some View {
        
        //Stack
        VStack {
            
            //Push Down
            Spacer()
            
            //Other Action Buttons
            otherActions
            
            Divider()
            
            //
            //THIS IS THE BIG BLUE BUTTON
            //
            splitButton
            
        }
        
    }
    
    
    var splitButton : some View {
        
        Button() {
            
            if (!lockSplitButton) {
                
                //Cause Split
                if (timerRunning) {
                    
                    SplitCreate()
                    
                    //Start Timer
                } else {
                    
                    TimerStart()
                    
                }
                
            } else {

                //Reset
                TimerReset();
                
            }
            
        } label: {
            splitButtonLabel
        }
        
    }
    
    var splitButtonLabel : some View {
        
        VStack {
            
            //Horizontal Space Full
            HStack { Spacer() }
            
            let buttonText = (timerRunning) ? "Tap To Split" : (lockSplitButton) ? "Start New Run" : "Tap To Start Run"
            
            Text(buttonText)
                .fontWeight(.semibold).padding(.bottom, 5).foregroundColor(.white)

        }
        .frame(height: 160)
        .padding(.leading)
        .background(lockSplitButton ? Color(.systemGray) : (timerRunning) ? Color(.systemBlue) : Color(.systemGreen))

    }
    
    //
    //
    //
    //
    
    var otherActions : some View {
        HStack {
            
            //Pause
            Button {
                
                if (timerRunning) {
                    
                    TimerPause()
                    
                }
                
            } label: {
                RunSmallButtonLabelView(buttonSize: buttonSize,
                                        buttonLabelImage: "pause",
                                        backgroundCol: timerRunning ? b : g)
            }
            
            //
            //
            //
            
            //Undo Split
            Button {
                
                SplitUndo();
                
            } label: {
                RunSmallButtonLabelView(buttonSize: buttonSize,
                                        buttonLabelImage: "arrow.uturn.backward",
                                        backgroundCol: (splitsHit > 0) ? b : g)
            }
            
            //
            //
            //
            
            Spacer()
            
            //Reset
            let resetButtonActive = !lockSplitButton && storedTimerTime > 0
            Button {
                
                if (resetButtonActive) {
                    TimerReset();
                }
                
            } label: {
                RunSmallButtonLabelView(buttonSize: buttonSize,
                                        buttonLabelImage: "trash",
                                        backgroundCol: (resetButtonActive) ? Color(.systemRed) : g)
            }
            

        }
    }
}

//


struct RunPageView_Previews: PreviewProvider {
    static var previews: some View {
        RunPageView()
    }
}

//
//
//
//      HELPER FUNCTIONS
//
//
//

extension RunPageView {
    
    func TimerStart() {
        timerRunning = true;
    }
    
    func TimerPause() {
        timerRunning = false;
    }
    
    func TimerReset() {
        //Stop The Time
        timerRunning = false;
        
        //Reset Stored Time
        storedTimerTime = 0.0;
        
        //Reset Hit Counter
        SplitsReset()
    }
    
    func TimerUpdate() {
        //Early Exit
        guard isActive else { return }
        
        //Update
        if (timerRunning) {
            storedTimerTime += timeStep
        }
    }
    
    func TimerUpdateOnSceneUpdate(newPhase: ScenePhase) {
        
        //App Opens
        if newPhase == .active {
            
            //Make Sure App Not Active
            if (!isActive) {
                
                //Toggle
                isActive = true
                
                //Print
                print("App Opened!")
                
                //Add Any Missing Time
                if (timerRunning) {
                    storedTimerTime += Date().timeIntervalSince(dateAppClosed)
                }
            }
            
        } else {
            
            //Make Sure Active
            if (isActive) {
                
                //Print
                print("App Closed!")
                
                //App Closes
                isActive = false
                dateAppClosed = Date()
            }
            
        }
    }
    
    func TimerStop() {
        
        //Stop Running, Nothing Else Happens
        timerRunning = false;
        
        //Lock
        lockSplitButton = true;
        
    }
    
    //
    //
    //
    
    func SplitCreate() {
        
        if (!lockSplitButton) {
            
            //Get Time Difference
            let timeForSplit = storedTimerTime - timeLastSplitCreated;
            timeLastSplitCreated = storedTimerTime;
            
            //Create Split
            let newSplitInfo = SplitDisplayStruct(splitId: splitsHit, splitName: "1-" + String(splitsHit), timeTook: timeForSplit);
            splitsHit += 1;
            
            //Add To List
            displaySplits.insert(newSplitInfo, at: 0)
            
            print("Split created")
            
            //Finish
            if (splitsHit == totalSplitCount) {
                
                TimerStop()
                
            }
        }
        
    }
    
    func SplitUndo() {
        
        if (splitsHit > 0) {
            splitsHit -= 1;
            
            //Delete
            displaySplits.remove(at: 0)
            
            print("Split Removed")
            
            //Unlock If Locked
            lockSplitButton = false;
        }
    }
    
    func SplitsReset() {
        
        //Stop
        splitsHit = 0;
        timeLastSplitCreated = 0;
        
        //Reset
        displaySplits.removeAll()
        
        //Unlock
        lockSplitButton = false;
        
    }
    
}
