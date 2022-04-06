//
//  OnboardingView.swift
//  Moments
//
//  Created by Yang Jianqi on 2022/4/1.
//

import SwiftUI

struct OnboardingView: View {
    @Binding var unLocked: Bool
    
    @State private var isAnimating: Bool = false
    @State private var SlideWidth: Double = UIScreen.main.bounds.width - 80
    @State private var mainPic = OnboardingPic
    @State private var picid = 0
    @State private var SlideOffset: Double = 0
    
    var body: some View {
        VStack(spacing: 20){
            //MARK: Header
            VStack {
                Text("Moments")
                    .font(.system(size: 60, weight: .bold, design: .serif))
                
                Text("""
                     Love is
                     when you find
                     someone better yet
                     you stay with the same person
                     you promised to spend forever with.
                     """)
                .font(.title3)
                .fontWeight(.light)
                .multilineTextAlignment(.center)
                .padding(.horizontal, 10)
            }
            .opacity(isAnimating ? 1 : 0)
            .offset(y:isAnimating ? 0 : -100)
            .animation(.easeOut(duration: 1), value: isAnimating)
            
            Spacer()
            
            //MARK: Center
            
            ZStack{
                Circle()
                    .stroke(Color("OurPink").opacity(0.2), lineWidth: 40)
                    .frame(width: 260, height: 260, alignment: .center)
                Circle()
                    .stroke(Color("OurPink").opacity(0.2), lineWidth: 80)
                    .frame(width: 260, height: 260, alignment: .center)
                
                Image(mainPic[picid])
                    .resizable()
                    .scaledToFit()
                    .aspectRatio(contentMode: .fill)
                    .clipShape(Circle())
                    .frame(width: 150, height: 150, alignment: .center)
                    .overlay {
                        Circle().stroke(.white, lineWidth: 4)
                    }
                    .shadow(radius: 5)
            }
            .opacity(isAnimating ? 1 : 0)
            .animation(.easeIn(duration: 1), value: isAnimating)
            
            Button(action: {
                if picid >= mainPic.count - 1 {
                    picid = 0
                } else {
                    picid = picid + 1
                }
            }) {
              HStack(spacing: 8) {
                Text("Change")
                      .foregroundColor(.gray)
                      .frame(alignment: .center)
                
                Image(systemName: "arrow.left.arrow.right.circle")
                      .foregroundColor(.gray)
                      .font(.system(size: 25))
              }
              .opacity(isAnimating ? 1 : 0)
              .animation(.easeInOut(duration: 1), value: isAnimating)
            }
            .padding()
            .background(.ultraThickMaterial)
            .cornerRadius(20)
            .offset(y: 50)
            Spacer()
            
            //MARK: Bottom
            
            Spacer()
            ZStack {
                //Part-1
                Capsule()
                    .fill(Color.red.opacity(0.2))
                Capsule()
                    .fill(Color.red.opacity(0.2))
                    .padding(12)
                
                //Part-2
                Text("Slide to Unlock")
                    .font(.system(.title3, design: .rounded))
                    .fontWeight(.light)
                    .foregroundColor(.white)
                    .offset(x: 25)
                
                //Part-3
                HStack {
                    Capsule()
                        .fill(Color("OurBlue"))
                        .frame(width: SlideOffset + 80)
                        .opacity(0.8)
                    
                    Spacer()
                }
                
                //Part-4
                HStack {
                    ZStack {
                        Circle()
                            .fill(Color("OurBlue"))
                        Circle()
                            .fill(.black.opacity(0.2))
                            .padding(8)
                        Image(systemName: "chevron.right.2")
                            .opacity( 1 - (SlideOffset/SlideWidth))
                            .font(.system(size: 24, weight: .bold, design: .rounded))
                    }
                    .foregroundColor(.white)
                    .frame(width: 80, height: 80, alignment: .center)
                    .offset(x: SlideOffset)
                    .gesture(
                        DragGesture()
                            .onChanged { gesture in
                                withAnimation(Animation.linear) {
                                    if gesture.translation.width > 0 && SlideOffset <=  SlideWidth - 80 {
                                        SlideOffset = gesture.translation.width
                                    }
                                }
                            }
                            .onEnded { _ in
                                withAnimation(Animation.easeOut(duration: 0.4)){
                                    if SlideOffset > SlideWidth - 80 {
                                        SlideOffset = SlideWidth - 80
                                        unLocked = true
                                    } else {
                                        SlideOffset = 0
                                    }
                                }
                            }
                    )
                    Spacer()
                }
            }//ZStack
            .opacity(isAnimating ? 1 : 0)
            .offset(y: isAnimating ? 0 : 100)
            .animation(.easeIn(duration: 1), value: isAnimating)
            .frame(width: SlideWidth, height: 80, alignment: .center)
        }
        .onAppear {
            isAnimating = true
        }
    }
}

struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView(unLocked: .constant(false))
    }
}
