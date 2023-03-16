//
//  MagnificationGestureBootcamp.swift
//  SwiftfulContinuedLearning
//
//  Created by Yomi on 3/14/23.
//

import SwiftUI

struct MagnificationGestureBootcamp: View {
    
    @State var currentAmount: CGFloat = 0
    @State var lastAmount: CGFloat = 0
    
    var body: some View {
        // mock instagram feed
        VStack{
            HStack{
                Circle()
                    .frame(width: 35, height: 35)
                Text("Akinseye Abayomi")
                Spacer()
                Image(systemName: "ellipsis")
            }.padding()
            
            Rectangle()
                .frame(height: 300)
                .scaleEffect(1 + currentAmount)
                .gesture(
                    MagnificationGesture()
                        .onChanged{ value in
                            currentAmount = value - 1
                        }
                        .onEnded{ value in
                            withAnimation(.spring()){
                                currentAmount = 0
                            }
                            
                        }
                )
            HStack{
                Image(systemName: "heart.fill")
                Image(systemName: "globe")
                Image(systemName: "xmark")
            }
            .font(.title2)
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding()
            
            Text("This is the caption of my profile on instagram")
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.horizontal)
        }
        
        
//        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
//            .padding()
//            .font(.title)
//            .background(.red)
//            .cornerRadius(10)
//            .scaleEffect(1 + currentAmount)
//            .gesture(
//                MagnificationGesture()
//                    .onChanged { value in
//                        currentAmount = value - 1
//                    }
//                    .onEnded{ value in
//                        lastAmount = lastAmount + currentAmount
//                        currentAmount = 0
//                    }
//            )
    }
}

struct MagnificationGestureBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        MagnificationGestureBootcamp()
    }
}
