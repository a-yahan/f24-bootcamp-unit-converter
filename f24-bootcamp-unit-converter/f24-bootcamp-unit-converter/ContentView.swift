//
//  ContentView.swift
//  f24-bootcamp-unit-converter
//
//  Created by Yahan Yang on 10/1/24.
//

import SwiftUI

struct ContentView: View {
    
    
    @State var inputValue = 0.0
    @State var inputUnit = ""
    @State var convertUnit = ""
    
    let literToMilliliter = 1000.0
    let cupToMilliliter = 236.588
    let pintToMilliliter = 473.176
    let gallonToMilliliter = 3785.41
    
    let units = ["mL", "Liters", "Cups", "Pints", "Gallons"]
    
    var body: some View {
        NavigationStack{
            Form{
                Section("Input Value and Unit"){
                    TextField("Value", value: $inputValue,format:.number)
                    Picker("Select a Unit",selection: $inputUnit){
                        ForEach(units,id:\.self){unit in
                            Text(unit)
                        }
                    }
                } .pickerStyle(.segmented)
                Section("Convert to"){
                    Picker("Unit to convert", selection: $convertUnit){
                        ForEach(units, id:\.self){unit in
                            Text(unit)
                        }
                    }
                } .pickerStyle(.segmented)
                Section("Output"){
                    Text("\(outputUnit, specifier: "%.2f")")
                }
                .navigationTitle("Volume Converter")
            }
        }
        
    }
    
    var inputToML: Double {
        switch inputUnit{ //like an if-else statement, but matches inputs with cases
        case "mL":
            return inputValue
        case "Liters":
            return inputValue*literToMilliliter
        case "Cups":
            return inputValue*cupToMilliliter
        case "Pins":
            return inputValue*pintToMilliliter
        default:
            return gallonToMilliliter
        }
        
    }
    
    var outputUnit: Double{
        switch convertUnit{ //like an if-else statement, but matches inputs with cases
        case "mL":
            return inputToML
        case "Liters":
            return inputToML/literToMilliliter
        case "Cups":
            return inputToML/cupToMilliliter
        case "Pins":
            return inputToML/pintToMilliliter
        default:
            return inputToML/gallonToMilliliter
        }
    }
    
    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
    }
}
