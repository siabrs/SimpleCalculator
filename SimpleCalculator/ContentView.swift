//
//  ContentView.swift
//  SimpleCalculator
//
//  Created by Oleksandra Siabrenko on 10.04.2023.
//

import SwiftUI

struct ContentView: View {
    @State private var firstNumber = ""
    @State private var secondNumber = ""
    @FocusState private var amountIsFocused: Bool
    @State private var action = "➖"
    var actions = ["➕", "➖", "✖️", "➗"]

    var addition: Double {
        return (Double(firstNumber) ?? 0) + (Double(secondNumber) ?? 0)
    }
    
    var subtraction: Double {
        return (Double(firstNumber) ?? 0) - (Double(secondNumber) ?? 0)
    }
    
    var division: Double {
        return (Double(firstNumber) ?? 0) / (Double(secondNumber) ?? 0)
    }
    
    var multiplication: Double {
        return (Double(firstNumber) ?? 0) * (Double(secondNumber) ?? 0)
    }
    
    func getResult() -> Double {
        switch action {
        case "➕":
            return addition
        case "➖":
            return subtraction
        case "✖️":
            return multiplication
        case "➗":
            return division
        default:
            return 0.00
        }
    }
    
    var body: some View {
        NavigationView {
            Form {
                HStack {
                    TextField("First Number", text: $firstNumber)
                    Divider()
                    TextField("Second Number", text: $secondNumber)
                }
                .multilineTextAlignment(.center)
                .keyboardType(.decimalPad)
                .focused($amountIsFocused)

                Picker("Actions:", selection: $action) {
                    ForEach(actions, id: \.self) {
                        Text($0)
                    }
                }
                .colorMultiply(Color(red: 0.96, green: 0.67, blue: 0.91))
                .pickerStyle(.segmented)
                .onAppear {
                    UISegmentedControl.appearance().backgroundColor = UIColor(red: 0.988, green: 0.964, blue: 0.984, alpha: 0.17)
                }
                .padding(3)
                
                Section {
                    Text(String(format: "%.2f", getResult().isNaN == true ? 0.00 :getResult()))
                } header: {
                    Text("YOUR RESULT:")
                        .font(.headline)
                        .foregroundColor(Color(red: 0.8, green: 0.3, blue: 0.8, opacity: 0.45))
                }
            }
            .navigationTitle("Simple Calculator")
            .toolbar {
                ToolbarItemGroup(placement: .keyboard) {
                    Spacer()

                    Button("Done") {
                        amountIsFocused = false
                    }
                    .foregroundColor(Color(red: 0.8, green: 0.3, blue: 0.8, opacity: 0.45))
                    .bold()
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
