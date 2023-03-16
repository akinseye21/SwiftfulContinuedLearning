//
//  LongPressedGesture.swift
//  SwiftfulContinuedLearning
//
//  Created by Yomi on 3/14/23.
//

import SwiftUI

struct LongPressedGesture: View {
    
    @State var isComplete: Bool = false
    @State var isSuccess: Bool = false
    
    var body: some View {
        
        VStack{
            Rectangle()
                .fill(isSuccess ? .green : .blue)
                .frame(maxWidth: isComplete ? .infinity : 0)
                .frame(height: 55)
                .frame(maxWidth: .infinity, alignment: .leading)
                .background(.gray)
            
            HStack{
                Text("Increase")
                    .padding()
                    .padding(.horizontal)
                    .background(.black)
                    .foregroundColor(.white)
                    .cornerRadius(10)
                    .onLongPressGesture(minimumDuration: 1.0, maximumDistance: 50) { isPressing in
                        //start of press to the min duration
                        if isPressing{
                            withAnimation(.easeInOut(duration: 1.0)){
                                isComplete = true
                            }
                        }else{
                            DispatchQueue.main.asyncAfter(deadline: .now() + 0.1){
                                if !isSuccess{
                                    withAnimation(.easeInOut){
                                        isComplete = false
                                    }
                                }
                            }
                        }
                    } perform:{
                        // at the min duration
                        withAnimation(.easeInOut){
                            isSuccess = true
                        }
                    }
                
                Text("Decrease")
                    .padding()
                    .padding(.horizontal)
                    .background(.black)
                    .foregroundColor(.white)
                    .cornerRadius(10)
                    .onTapGesture {
                        isComplete = false
                        isSuccess = false
                    }
            }
        }
        
        
        
        
//        Text(isPressed ? "Complete" : "Not complete")
//            .padding()
//            .padding(.horizontal)
//            .background(isPressed ? .blue : .black)
//            .foregroundColor(.white)
//            .cornerRadius(10)
//            .onLongPressGesture {
//                isPressed.toggle()
//            }
    }
}

struct LongPressedGesture_Previews: PreviewProvider {
    static var previews: some View {
        LongPressedGesture()
    }
}
