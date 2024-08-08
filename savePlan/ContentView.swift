//
//  ContentView.swift
//  savePlan
//
//  Created by 탁제원 on 8/7/24.
//

import SwiftUI

struct ContentView: View {
    
    @State private var isBottomSheetOpen = false
    
    var body: some View {
        VStack {
            VStack(alignment: .trailing){
                Button("월별"){
                    
                }
                .foregroundColor(.black)
                .frame(width: 85.0, height: 33.0)
                .background {
                    Color(.white)
                        .ignoresSafeArea()
                }
                .cornerRadius(/*@START_MENU_TOKEN@*/30.0/*@END_MENU_TOKEN@*/)
                .overlay(
                    RoundedRectangle(cornerRadius: 30)
                        .stroke(.black, lineWidth: 1)
                )
            }
            .frame(maxWidth: .infinity, maxHeight: 50)
            
            Text("2024")
            Grid(horizontalSpacing: 10, verticalSpacing: 10) {
                ForEach(0..<4) { _ in
                    GridRow {
                        ForEach(0..<3) { _ in
                            ZStack(alignment: .topLeading) {
                                Color("MainBackgroundColor")
                                    .cornerRadius(10.0)
                                Text("2").padding(10)
                                    
                            }
                            
                        }
                    }.frame(width: 110, height: 120)
                }
            }
            .padding()
            
        
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
                        Button("월별"){
                            
                        }
                        .foregroundColor(.black)
                        .frame(width: 85.0, height: 85.0)
                        .background {
                            Color(.white)
                                .ignoresSafeArea()
                        }
                        .cornerRadius(15)
                        
                        Button("월별"){
                            
                        }
                        .foregroundColor(.black)
                        .frame(width: 85.0, height: 85.0)
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
