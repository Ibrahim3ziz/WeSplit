//
//  ContentView.swift
//  WeSplit
//
//  Created by Ibrahim Abdul Aziz on 21/12/2021.
//

import SwiftUI

struct ContentView: View {
    @State private var checkAmount = "0.0"
    @State private var numberOfPeople = 2
    @State private var tipPrecentage = 20
//  @FocusState var amountIsFocused: Bool
    
    
    var totalPerPerson: Double {
        
        let peopleCount = Double(numberOfPeople + 2)
        let tipSelection = Double(tipPrecentage)
        
        let tipValue = Double(checkAmount)! / 100 * tipSelection
        let grandTotal = Double(checkAmount)! + tipValue
        let amountPerPerson = grandTotal / peopleCount
        
        return amountPerPerson
    }
    
    var checkAmountAndtipValue: Double {
        let tipSelection = Double(tipPrecentage)
        let tipValue = Double(checkAmount)! / 100 * tipSelection

        return Double(checkAmount)! + Double(tipValue)
    }
    

//    var currencyFormat: NumberFormatter {
//        let format = NumberFormatter()
//        format.numberStyle = .currency
//        format.currencyCode = Locale.current.currencyCode ?? "USD"
//        return format
//    }
    
    
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    //need to be updated
//                    TextField("Amount", value: $checkAmount, formatter: currencyFormat)
                    TextField("Amount", text: $checkAmount)
                        .keyboardType(.decimalPad)
//                        .focused($amountIsFocused)
                    
                    Picker("number of people", selection: $numberOfPeople) {
                        ForEach(2..<100) {
                            
                            Text("\($0) people")
                        }
                    }
                }
                // need to be updated
                Section(header: Text("Add a tip ?")) {
                    Picker("Tip Percentage", selection: $tipPrecentage) {
                        ForEach(0..<101, id: \.self) {
                            Text("\($0)%")
                        }
                    }
                }
                
                Section(header: Text("Amount per person:")) {
                    Text("\(totalPerPerson)")
                }
                
                Section(header: Text("Total Check:")) {
                    Text("\(checkAmountAndtipValue)")
                }
            }
            .navigationTitle("WeSplit")
//            .toolbar {
//                ToolbarItemGroup(placement: .keyboard) {
//                    Button("Done") {
//                        amountIsFocused = false
//                    }
//                }
//            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
