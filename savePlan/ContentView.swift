//
//  ContentView.swift
//  savePlan
//
//  Created by 탁제원 on 8/7/24.
//

import SwiftUI

enum PlanViewType {
    case monthly
    case yearly
}

struct ContentView: View {
    
    @State private var isBottomSheetOpen = false
    @State private var showType: PlanViewType = .monthly
    
    var body: some View {
        
        let today = Date()
        let components = Calendar.current.dateComponents([.year, .month], from: today)
        let year = components.year ?? 0
        let month = components.month ?? 0
        
        VStack {
            HStack(){
                Spacer()
                Button(action: {
                    if showType == .monthly {
                        showType = .yearly
                    } else {
                        showType = .monthly
                    }
                }) {
                    Text(showType == .monthly ? "월별" : "년도별")
                        .foregroundColor(.black)
                        .frame(width: 85.0, height: 33.0)
                        .background(Color.white)
                        .cornerRadius(30.0)
                        .overlay(
                            RoundedRectangle(cornerRadius: 30)
                                .stroke(.black, lineWidth: 1)
                        )
                }
            }
            .frame(maxWidth: .infinity, maxHeight: 50)
            .padding(.horizontal)
            
            if (showType == .monthly) {
                
                Text(Date.now, format: .dateTime.year())
                    .font(Font.title)
                    .padding(.bottom)
                
                Grid(horizontalSpacing: 10, verticalSpacing: 10) {
                    ForEach(0..<4) { columnIndex in
                        GridRow {
                            ForEach(0..<3) { rowIndex in
                                ZStack(alignment: .topLeading) {
                                    Color("MainBackgroundColor")
                                        .cornerRadius(10.0)
                                    Text("\((rowIndex + 1) + (columnIndex * 3))").padding(10)
                                        
                                        
                                }
                                .overlay(
                                    RoundedRectangle(cornerRadius: 10)
                                        .stroke(.black, lineWidth: (rowIndex + 1) + (columnIndex * 3) == month ? 1 : 0)
                                )
                                
                            }
                        }.frame(width: 110, height: 120)
                    }
                }
                .padding()
            } else {
                ScrollView {
                    
                        Grid(horizontalSpacing: 10, verticalSpacing: 10) {
                            ForEach(0..<5) { columnIndex in
                                ZStack(alignment: .topLeading) {
                                    Color("MainBackgroundColor")
                                        .cornerRadius(10.0)
                                    Text("2024").padding(10)
                                    
                                }
                                .frame(height: 116)
                            }
                        }
                        .padding()
                }
                .padding()
                .frame(height: 600)
            }
                
        
        }
        .padding(0.0)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background {
            Color(.white)
                .ignoresSafeArea()
        }
        
        BottomSheetView(isOpen: $isBottomSheetOpen, maxHeight: 500) {
                VStack(alignment: .trailing){
                    HStack(){
                        Button("+ money plan"){
                            
                        }
                        .foregroundColor(.black)
                        .frame(width: 150.0, height: 50.0)
                        .background {
                            Color(.white)
                                .ignoresSafeArea()
                        }
                        .cornerRadius(15)
                        
                        Button("월별"){
                            
                        }
                        .foregroundColor(.black)
                        .frame(width: 85.0, height: 50.0)
                        .background {
                            Color(.white)
                                .ignoresSafeArea()
                        }
                        .cornerRadius(15)
                    }
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    
                }
                .frame(maxWidth: .infinity, maxHeight: 50)
        }
        .edgesIgnoringSafeArea(.all)
        .background {
            Color(.white)
                .ignoresSafeArea()
        }
        
    }
}

#Preview {
    ContentView()
}
