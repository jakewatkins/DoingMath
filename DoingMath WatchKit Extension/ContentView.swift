//
//  ContentView.swift
//  DoingMath WatchKit Extension
//
//  Created by jake watkins on 1/19/21.
//

import SwiftUI

struct ContentView: View {
    @State var totalWeight = 0
    @State var barSelected = false
    
    var body: some View {
        if false == barSelected {
            VStack {
                Text("Bar Type")
                HStack {
                    Button(action:{SetBar(barType: 45)}) {
                        Text("45#")
                    }
                    Button(action:{SetBar(barType: 35)}) {
                        Text("35#")
                    }
                    Button(action:{SetBar(barType: 15)}) {
                        Text("15#")
                    }
                }
            }
        }
        else
        {
            VStack {
                Text("Total: \(totalWeight)")
                HStack {
                    Button(action: {AddWeight(weight: 55)})
                    {
                        ZStack {
                            Circle().frame(width:25, height:25).foregroundColor(.red)
                            Text("55")
                        }
                    }
                    Button(action: {AddWeight(weight: 45)})
                    {
                        ZStack {
                            Circle().frame(width:25, height:25).foregroundColor(.blue)
                            Text("45")
                        }
                    }
                    Button(action: {AddWeight(weight: 35)})
                    {
                        ZStack {
                            Circle().frame(width:25, height:25).foregroundColor(.yellow)
                            Text("35").foregroundColor(.black)
                        }
                    }
                    Button(action: {AddWeight(weight: 25)})
                    {
                        ZStack {
                            Circle().frame(width:25, height:25).foregroundColor(.green)
                            Text("25")
                        }
                    }
                    Button(action: {AddWeight(weight: 15)})
                    {
                        ZStack {
                            Circle().frame(width:25, height:25).foregroundColor(.black)
                            Text("15")
                        }
                    }
                }
                HStack {
                    Button(action: {AddWeight(weight: 10)})
                    {
                        ZStack {
                            Circle().frame(width:25, height:25).foregroundColor(.white)
                            Text("10").foregroundColor(.black)
                        }
                    }
                    Button(action: {AddWeight(weight: 5)})
                    {
                        ZStack {
                            Circle().frame(width:25, height:25).foregroundColor(.red)
                            Text("5")
                        }
                    }
                    Button(action: {AddWeight(weight: 2.5)})
                    {
                        ZStack {
                            Circle().frame(width:25, height:25).foregroundColor(.green)
                            Text("2.5")
                        }
                    }
                    Button(action: {AddWeight(weight: 1)})
                    {
                        ZStack {
                            Circle().frame(width:25, height:25).foregroundColor(.white)
                            Text("1").foregroundColor(.black)
                        }
                    }
                }
                Button(action:{Reset()})
                {
                        Text("Reset")
                }
            }
        }
    }
    
    func AddWeight(weight:Float) {
        totalWeight += (Int) (2*weight)
    }
    
    func SetBar(barType:Int) {
        totalWeight = barType
        barSelected = true
    }
    
    func Reset() {
        totalWeight = 0
        barSelected = false
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
