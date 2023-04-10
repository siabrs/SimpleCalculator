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

    var body: some View {
        NavigationView {
            Form {
                HStack {
                    TextField("First Number", text: $firstNumber)
                    Divider()
                    TextField("Second Number", text: $secondNumber)
                }
                .multilineTextAlignment(.center)
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
