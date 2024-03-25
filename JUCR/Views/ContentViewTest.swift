//
//  ContentViewTest.swift
//  JUCR
//
//  Created by Leo Marliere on 25/03/2024.
//

import SwiftUI

struct ContentViewTest: View {
    @State private var isDragging = false
    @State private var whiteViewHeight: CGFloat = UIScreen.main.bounds.height * 0.6 // Initial height of the white view
    @State private var showSingleText = false

    var body: some View {
        VStack(spacing: 0) {
            // Red background at the top
            Color.red
                .frame(height: 100) // Adjust height as needed

            // Top content: Text, Text, Image, Text
            if !showSingleText {
                VStack {
                    Text("First Text")
                    Text("Second Text")
                    Image(systemName: "car")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 100, height: 100)
                    Text("Fourth Text")
                }
                .padding()
            } else {
                Text("Combined Text")
                    .padding()
            }

            // White view that can be dragged
            GeometryReader { geometry in
                Color.white
                    .frame(height: isDragging ? geometry.size.height * 0.8 : whiteViewHeight)
                    .gesture(DragGesture()
                        .onChanged { value in
                            withAnimation {
                                isDragging = true
                                let newHeight = whiteViewHeight + value.translation.height
                                whiteViewHeight = max(UIScreen.main.bounds.height * 0.4, min(newHeight, geometry.size.height * 0.8))

                                // Check if white view height reaches 80% of the screen
                                if whiteViewHeight >= geometry.size.height * 0.8 {
                                    showSingleText = true
                                } else {
                                    showSingleText = false
                                }
                            }
                        }
                        .onEnded { _ in
                            withAnimation {
                                isDragging = false
                            }
                        }
                    )
            }
        }
        .edgesIgnoringSafeArea(.top)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentViewTest()
    }
}

