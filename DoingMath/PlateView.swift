//
//  PlateView.swift
//  DoingMath
//
//  Created by jake watkins on 1/27/21.
//

import SwiftUI

struct PlateView: View {
    @State var weight : Int = 0
    @State var isStandard : Bool = true
    @State var measureSystem : String = "Standard"
    @State var barWeight:Float = 45.0
    @State var symbol = "#"
    @State var partialNeeded:Bool = false
    
    @State var weightIsOn:[Bool] = [true, true, true, true, true, true, true, true, true]
    @State var weightValue:[Float] = [0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0]
    @State var weightCount:[Int] = [0, 0, 0, 0, 0, 0, 0, 0, 0]
    
    let standardBars:[Float] = [45, 35, 15]
    let metricBars:[Float] = [20, 15, 7]
    let standardWeights:[Float] = [55,45,35,25,15,10, 5, 2.5, 1]
    let metricWeights:[Float] =   [25,20,15,10,7,5,1.5,  1, 0.5]
    
    var body: some View {
        VStack {
            HStack {
                Text("Weight")
                NumberTextField(value: $weight)
            }
            Button(action:{CalcPlatesNeeded()}) {
                Text("Calculate")
                    .frame(width: /*@START_MENU_TOKEN@*/100.0/*@END_MENU_TOKEN@*/, height: /*@START_MENU_TOKEN@*/30.0/*@END_MENU_TOKEN@*/)
            }.border(Color.blue, width:1).padding(.bottom)
            HStack(spacing: 10.0) {
                Button(action: {SetMeasureSystem(ms:"Standard")}, label: {
                    Text("Std")
                        .background(measureSystem == "Standard" ? Color.blue : Color.white)
                        .foregroundColor(measureSystem == "Standard" ? Color.white : Color.blue)
                })
                .padding(.horizontal)
                Button(action: {SetMeasureSystem(ms:"Metric")}, label: {
                    Text("Metric").background(measureSystem == "Metric" ? Color.blue : Color.white)
                        .foregroundColor(measureSystem == "Metric" ? Color.white : Color.blue)
                })
                .padding(.horizontal)
            }.padding(.bottom)
            HStack {
                Button(action:{SetBar(barType: 0)}, label: {
                    Text(GetBarLabel(barType: 0))
                        .background(IsBarSelected(barType: 0) ? Color.blue : Color.white)
                        .foregroundColor(IsBarSelected(barType: 0) ? Color.white : Color.blue)
                })
                .padding(.horizontal)
                Button(action:{SetBar(barType: 1)}, label: {
                    Text(GetBarLabel(barType: 1))
                        .background(IsBarSelected(barType: 1) ? Color.blue : Color.white)
                        .foregroundColor(IsBarSelected(barType: 1) ? Color.white : Color.blue)
                })
                .padding(.horizontal)
                Button(action:{SetBar(barType: 2)}, label: {
                    Text(GetBarLabel(barType: 2))
                        .background(IsBarSelected(barType: 2)  ? Color.blue : Color.white)
                        .foregroundColor(IsBarSelected(barType: 2) ? Color.white : Color.blue)
                })
                .padding(.horizontal)
            }
            .padding(.horizontal, 15.0)
            
            VStack {
                HStack {
                    HStack {
                        Toggle("", isOn:$weightIsOn[0])
                        ZStack {
                            Circle().frame(width:60, height:60).foregroundColor(.red)
                            Text(GetWeightLabel(weightNum: 0)).foregroundColor(.black)
                        }
                        Text("\(weightCount[0])")
                    }
                    HStack {
                        Toggle("", isOn:$weightIsOn[1])
                        ZStack {
                            Circle().frame(width:60, height:60).foregroundColor(.blue)
                            Text(GetWeightLabel(weightNum: 1)).foregroundColor(.black)
                        }
                        Text("\(weightCount[1])")
                    }
                }
                HStack {
                    HStack {
                        Toggle("", isOn:$weightIsOn[2])
                        ZStack {
                            Circle().frame(width:60, height:60).foregroundColor(.yellow)
                            Text(GetWeightLabel(weightNum: 2)).foregroundColor(.black)
                        }
                        Text("\(weightCount[2])")
                    }
                    HStack {
                        Toggle("", isOn:$weightIsOn[3])
                        ZStack {
                            Circle().frame(width:60, height:60).foregroundColor(.green)
                            Text(GetWeightLabel(weightNum: 3)).foregroundColor(.black)
                        }
                        Text("\(weightCount[3])")
                    }
                }
                HStack {
                    HStack {
                        Toggle("", isOn:$weightIsOn[4])
                        ZStack {
                            Circle().strokeBorder(Color.white).frame(width:60, height:60).foregroundColor(.black)
                            Text(GetWeightLabel(weightNum: 4)).foregroundColor(.white)
                        }
                        Text("\(weightCount[4])")
                    }
                    HStack {
                        Toggle("", isOn:$weightIsOn[5])
                        ZStack {
                            Circle().strokeBorder(Color.black).background(Color(UIColor.white)).frame(width:60, height:60).foregroundColor(.white)
                            Text(GetWeightLabel(weightNum: 5)).foregroundColor(.black)
                        }
                        Text("\(weightCount[5])")
                    }
                }
                HStack {
                    HStack {
                        Toggle("", isOn:$weightIsOn[6])
                        ZStack {
                            Circle().frame(width:60, height:60).foregroundColor(.red)
                            Text(GetWeightLabel(weightNum: 6)).foregroundColor(.black)
                        }
                        Text("\(weightCount[6])")
                    }
                    HStack {
                        Toggle("", isOn:$weightIsOn[7])
                        ZStack {
                            Circle().frame(width:60, height:60).foregroundColor(.green)
                            Text(GetWeightLabel(weightNum: 7)).foregroundColor(.black)
                        }
                        Text("\(weightCount[7])")
                    }
                }
                HStack {
                    HStack {
                        Toggle("", isOn:$weightIsOn[8])
                        ZStack {
                            Circle().strokeBorder(Color.black).frame(width:60, height:60).foregroundColor(.white).background(Color(UIColor.white))
                            Text(GetWeightLabel(weightNum: 8)).foregroundColor(.black)
                        }
                        Text("\(weightCount[8])")
                    }
                    HStack {
                        
                    }
                }
            }
            .padding([.bottom, .trailing])
        }
    }
    
    func IsBarSelected(barType:Int) -> Bool {
        if("Standard" == measureSystem) {
            if(barWeight == standardBars[barType]) {
                return true
            }
        } else {
            if(barWeight == metricBars[barType]) {
                return true
            }
        }
        
        return false
    }
    func SetMeasureSystem(ms:String) {
        if("Standard" == ms) {
            isStandard = true
            measureSystem = "Standard"
            symbol = "#"
        } else {
            isStandard = false
            measureSystem = "Metric"
            symbol = "$"
        }
    }
    func GetWeightLabel(weightNum:Int) -> String {
        if(weightNum < 9) {
            if("Standard" == measureSystem) {
                return String(format:"%.0f", standardWeights[weightNum])
            } else {
                return String(format:"%.0f", metricWeights[weightNum])
            }
        }
        else {
            return String("")
        }
    }
    func GetBarLabel(barType: Int) -> String {
        if("Standard" == measureSystem) {
            return String(format:"%.0f", standardBars[barType])
        } else {
            return String(format:"%.0f", metricBars[barType])
        }
    }
    func GetBarWeight(barType: Int) -> Float {
        if("Standard" == measureSystem) {
            return standardBars[barType]
        } else {
            return metricBars[barType]
        }
    }
    func SetBar(barType:Int) {
        if("Standard" == measureSystem) {
            barWeight = standardBars[barType]
            symbol = "#"
        } else {
            barWeight = metricBars[barType]
            symbol = "kg"
        }
    }
    func GetPlateWeight(weightIndex:Int) -> Float {
        if("Standard" == measureSystem) {
            return standardWeights[weightIndex]
        } else {
            return metricWeights[weightIndex]
        }
    }
    func ClearPlateCounts() {
        for index:Int in 0...8 {
            weightCount[index] = 0
        }
    }
    func CalcPlatesNeeded() {
        hideKeyboard()
        ClearPlateCounts()

        var weightRemaining:Float = Float(weight) - barWeight
        
        for index:Int in 0...8 {
            if(weightRemaining > 1) {
                if(true == weightIsOn[index]) {
                    let plateWeight = GetPlateWeight(weightIndex: index) * 2
                    let numPlates:Int = Int(weightRemaining / plateWeight)
                    if(0 != numPlates) {
                        weightCount[index] = numPlates
                        weightRemaining = weightRemaining - (plateWeight*Float(numPlates))
                    }
                }
            }
        }
    }
    func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}

struct PlateView_Previews: PreviewProvider {
    static var previews: some View {
        PlateView()
    }
}
