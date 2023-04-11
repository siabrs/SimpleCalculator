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
    var actions = ["➕", "➖", "➗", "✖️"]

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
                .padding(3)
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
