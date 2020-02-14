//
//  ContentView.swift
//  Units
//
//  Created by Pedro Remedios on 11/02/2020.
//  Copyright © 2020 Pedro Remedios. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var fromValue = ""
    
    @State private var unitSelection1 = 2
    @State private var unitSelection2 = 1
    
    
    let lengthUnits = [UnitLength.centimeters, UnitLength.meters, UnitLength.inches, UnitLength.feet]
    
    var resultConversion: Double {
        let measurementFrom = Measurement(value: Double(fromValue) ?? 0, unit: lengthUnits[unitSelection1])
        return measurementFrom.converted(to: lengthUnits[unitSelection2]).value
    }
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Quantity to Convert", text: $fromValue)
                }
                Section(header: Text("In what unit is this value in?")) {
                    Picker("Unit", selection: $unitSelection1) {
                        ForEach(0 ..< lengthUnits.count) {
                            Text("\(self.lengthUnits[$0].symbol)")
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                }
                Section(header: Text("To what unit would you like to convert the value into?")) {
                    Picker("Unit", selection: $unitSelection2) {
                        ForEach(0 ..< lengthUnits.count) {
                            Text("\(self.lengthUnits[$0].symbol)")
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                }
                Section(header: Text("Result:")) {
                    Text("\(fromValue != "" ? self.resultConversion : 0, specifier: "%.2f")")
                }
            }
            .navigationBarTitle("Convertr")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
