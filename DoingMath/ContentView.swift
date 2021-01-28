//
//  ContentView.swift
//  DoingMath
//
//  Created by jake watkins on 1/24/21.
//

import SwiftUI

struct ContentView: View {
    @State var standard = true
    @State var totalWeight = 0
    @State var barSelected = false
    @State var symbol = "#"
    @State var selectedBar = 0
    
    let standardBar:[Int] = [45,35,15]
    let metricBar:[Int] = [20, 15, 7]
    let standardWeights:[Float] = [55,45,35,25,15,10, 5, 2.5, 1]
    let metricWeights:[Float] =   [25,20,15,10, 7, 5,1.5,  1, 0.5]
    
    var body: some View {
        TabView {
            VStack {
                Text("Weight Calculator").padding()
                
                Text("Total: \(totalWeight)\(symbol)")
                HStack {
                    Button(action: {SetMeasureSystem(ms:"Standard")}, label: {
                        Text("Standard")
                            .background(symbol == "#" ? Color.blue : Color(UIColor.systemBackground))
                            .foregroundColor(symbol == "#" ? Color.black : Color.blue)
                    })
                    .padding(.horizontal)
                    Button(action: {SetMeasureSystem(ms:"Metric")}, label: {
                        Text("Metric").background(symbol == "K" ? Color.blue : Color(UIColor.systemBackground))
                            .foregroundColor(symbol == "K" ? Color.black : Color.blue)
                    })
                }
                .padding()
                Text("Bar Type")
                HStack {
                    Button(action:{SetBar(barType: GetBarValue(barNum: 0))}) {
                        Text(GetBarLabel(barNum: 0)).background(selectedBar == 45 ? Color.blue : Color(UIColor.systemBackground))
                            .foregroundColor(selectedBar == 45 ? Color.black : Color.blue)
                    }.padding(.horizontal)
                    Button(action:{SetBar(barType: GetBarValue(barNum: 1))}) {
                        Text(GetBarLabel(barNum: 1))
                            .background(selectedBar == 35 ? Color.blue : Color(UIColor.systemBackground))
                            .foregroundColor(selectedBar == 35 ? Color.black : Color.blue)
                    }.padding(.horizontal)
                    Button(action:{SetBar(barType: GetBarValue(barNum: 2))}) {
                        Text(GetBarLabel(barNum: 2)).background(selectedBar == 35 ? Color.blue : Color(UIColor.systemBackground))
                            .foregroundColor(selectedBar == 35 ? Color.black : Color.blue)
                    }.padding(.horizontal)
                }.padding()
                HStack {
                    Button(action: {AddWeight(weight: GetWeightValue(weightNum: 0))})
                    {
                        ZStack {
                            Circle().frame(width:60, height:60).foregroundColor(.red)
                            Text(GetWeightLabel(weightNum: 0)).foregroundColor(.black)
                        }
                    }
                    Button(action: {AddWeight(weight: GetWeightValue(weightNum: 1))})
                    {
                        ZStack {
                            Circle().frame(width:60, height:60).foregroundColor(.blue)
                            Text(GetWeightLabel(weightNum: 1)).foregroundColor(.black)
                        }
                    }
                    Button(action: {AddWeight(weight: GetWeightValue(weightNum: 2))})
                    {
                        ZStack {
                            Circle().frame(width:60, height:60).foregroundColor(.yellow)
                            Text(GetWeightLabel(weightNum: 2)).foregroundColor(.black)
                        }
                    }
                }
                HStack {
                    Button(action: {AddWeight(weight: GetWeightValue(weightNum: 3))})
                    {
                        ZStack {
                            Circle().frame(width:60, height:60).foregroundColor(.green)
                            Text(GetWeightLabel(weightNum: 3)).foregroundColor(.black)
                        }
                    }
                    Button(action: {AddWeight(weight: GetWeightValue(weightNum: 4))})
                    {
                        ZStack {
                            Circle()
                                .overlay(
                                    Circle()
                                        .stroke(Color.white, lineWidth:2)
                                ).foregroundColor(.black).frame(width:60,height:60)
                            Text(GetWeightLabel(weightNum: 4)).foregroundColor(.white)
                        }
                    }
                    Button(action: {AddWeight(weight: GetWeightValue(weightNum: 5))})
                    {
                        ZStack {
                            Circle()
                                .overlay(
                                    Circle()
                                        .stroke(Color.black, lineWidth:2)
                                ).foregroundColor(.white).frame(width:60,height:60)
                            Text(GetWeightLabel(weightNum: 5)).foregroundColor(.black)
                        }
                    }
                }
                HStack {
                    Button(action: {AddWeight(weight: GetWeightValue(weightNum: 6))})
                    {
                        ZStack {
                            Circle().frame(width:60, height:60).foregroundColor(.red)
                            Text(GetWeightLabel(weightNum: 6)).foregroundColor(.black)
                        }
                    }
                    Button(action: {AddWeight(weight: GetWeightValue(weightNum: 7))})
                    {
                        ZStack {
                            Circle().frame(width:60, height:60).foregroundColor(.green)
                            Text(GetWeightLabel(weightNum: 7)).foregroundColor(.black)
                        }
                    }
                    Button(action: {AddWeight(weight: GetWeightValue(weightNum: 8))})
                    {
                        ZStack {
                            Circle()
                                .overlay(
                                    Circle()
                                        .stroke(Color.black, lineWidth:2)
                                ).foregroundColor(.white).frame(width:60,height:60)
                            Text(GetWeightLabel(weightNum: 8)).foregroundColor(.black)
                        }
                    }
                }
                Button(action:{Reset()})
                {
                        Text("Reset")
                }.padding()
                
            }.tabItem { Text("Weight") }
            VStack {
                PlateView()
            }.tabItem { Text("Plate") }
        }
    }
    
    func SetMeasureSystem(ms:String) {
        if("Standard" == ms) {
            standard = true
            symbol = "#"
        } else {
            standard = false
            symbol = "K"
        }
    }
    
    func GetBarLabel(barNum:Int) -> String {
        if(true == standard) {
            return String(standardBar[barNum]) + "#"
        } else {
            return String(metricBar[barNum]) + "K"
        }
    }
    
    func GetBarValue(barNum:Int) -> Int {
        if(true == standard) {
            return standardBar[barNum]
        } else {
            return metricBar[barNum]
        }
    }
    
    func GetWeightLabel(weightNum:Int) -> String {
        if(weightNum < 9) {
            if(true == standard) {
                if(standardWeights[weightNum] == 2.5) {
                    return "2.5"
                }
                return String(format:"%.0f", standardWeights[weightNum])
            } else {
                if(metricWeights[weightNum] == 0.5) {
                    return ".5"
                }
                return String(format:"%.0f", metricWeights[weightNum])
            }
        }
        else {
            return String("")
        }
    }

    func GetWeightValue(weightNum:Int) -> Float {
        if(weightNum < 9) {
            if(true == standard) {
                return standardWeights[weightNum]
            } else {
                return metricWeights[weightNum]
            }
        } else {
            return 0.0
        }
    }
    
    func IsStandard(isStandard:Bool) {
        standard = isStandard
    }
    
    func AddWeight(weight:Float) {
        totalWeight += (Int) (2*weight)
    }
    
    func SetBar(barType:Int) {
        totalWeight = barType
        barSelected = true
        selectedBar = barType
        if(true == standard) {
            symbol = "#"
        } else {
            symbol = "kg"
        }
    }
    
    func Reset() {
        selectedBar = 0
        totalWeight = 0
        barSelected = false
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
