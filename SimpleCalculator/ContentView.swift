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

                Picker("Actions:", selection: $action) {
                    ForEach(actions, id: \.self) {
                        Text($0)
                    }
                }
                .pickerStyle(.segmented)
                .background(Color(red: 0.8, green: 0.3, blue: 0.8, opacity: 0.2))
                .padding(3)
                
                Section {
                    Text(String(format: "%.2f", getResult()))
                } header: {
                    Text("YOUR RESULT:")
                        .font(.headline)
                        .foregroundColor(Color(red: 0.8, green: 0.3, blue: 0.8, opacity: 0.45))
                }
            }
            .navigationTitle("Calculator")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
