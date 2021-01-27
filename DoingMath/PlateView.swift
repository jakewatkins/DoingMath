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
    
    @State var weightIsOn:[Bool] = [true, true, true, true, true, true, true, true, true]
    @State var weightValue:[Float] = [0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0]
    @State var weightCount:[Int] = [0, 0, 0, 0, 0, 0, 0, 0, 0]
    
    let standardBars:[Float] = [45, 35, 15]
    let metricBars:[Float] = [20, 15, 7]
    let standardWeights:[Float] = [55,45,35,25,15,10, 5, 2.5, 1]
    let metricWeights:[Float] =   [25,20,15,10,7,5,1.5,  1, 0.5]
    
    var body: some View {
        VStack {
            Text("Plate Calculator")
            HStack {
                Text("Weight")
                NumberTextField(value: $weight)
            }
            HStack {
                Button(action: {SetMeasureSystem(ms:"Standard")}) {
                    Text("Std")
                }
                Button(action: {SetMeasureSystem(ms:"Metric")}) {
                    Text("Metric")
                }
            }
            HStack {
                Button(action:{SetBar(barType: 0)}) {
                    Text(GetBarLabel(barType: 0))
                }
                Button(action:{SetBar(barType: 1)}) {
                    Text(GetBarLabel(barType: 1))
                }
                Button(action:{SetBar(barType: 2)}) {
                    Text(GetBarLabel(barType: 2))
                }
            }
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
                            Circle().frame(width:60, height:60).foregroundColor(.black)
                            Text(GetWeightLabel(weightNum: 4)).foregroundColor(.white)
                        }
                        Text("\(weightCount[4])")
                    }
                    HStack {
                        Toggle("", isOn:$weightIsOn[5])
                        ZStack {
                            Circle().strokeBorder(Color.black).frame(width:60, height:60).foregroundColor(.white)
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
                    Toggle("", isOn:$weightIsOn[8])
                    ZStack {
                        Circle().strokeBorder(Color.black).frame(width:60, height:60).foregroundColor(.white)
                        Text(GetWeightLabel(weightNum: 8)).foregroundColor(.black)
                    }
                    Text("\(weightCount[8])")
                }
            }
        }
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
}

struct PlateView_Previews: PreviewProvider {
    static var previews: some View {
        PlateView()
    }
}
