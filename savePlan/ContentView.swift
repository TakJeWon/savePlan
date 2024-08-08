//
//  ContentView.swift
//  savePlan
//
//  Created by 탁제원 on 8/7/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
                Text("2024")
                Grid(horizontalSpacing: 10, verticalSpacing: 10) {
                    ForEach(0..<4) { _ in
                        GridRow {
                            ForEach(0..<3) { _ in
                                Color("MonthCellColor")
                            }
                        }.frame(width: 110, height: 120)
                    }
                }
                .padding()
        }
    }
}

#Preview {
    ContentView()
}
