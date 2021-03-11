//
//  CoolVideo.swift
//  Intelligent refrigerator
//
//  Created by cjj on 2021/3/3.
//

import SwiftUI
import AVKit
struct CoolVideo: View {
    @Environment(\.presentationMode) var presentationMode
    var body: some View {
//        AVPlayer(url: URL("sss")!)
        VStack {
            ZStack(alignment: .topLeading) {
                Rectangle().edgesIgnoringSafeArea(.top
                )
                Button(action: {
                    presentationMode.wrappedValue.dismiss()
                }, label: {
                    Image(systemName: "chevron.left")
                        .imageScale(.large)
                        .foregroundColor(.white)
                })
                .padding()
            }
            VStack {
                ProgressView("", value: 0.6)
                HStack{
                    Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                        Image(systemName: "play.fill")
                            .imageScale(.large)
                            
                    })
                    .padding()
                    Text("01:20 / 03:59")
                    Spacer()
                    HStack(spacing: 8.0) {
                        Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                            Image(systemName: "speaker.wave.2")
                                .imageScale(.large)
                                
                        })
                        Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                            Image(systemName: "eye.slash")
                                .imageScale(.large)
                                
                        })
                        Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                            Image(systemName: "play.fill")
                                .imageScale(.large)
                               
                        })
                        Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                            Image(systemName: "play.fill")
                                .imageScale(.large)
                                
                        })
                    }
                    .padding()
      
                }
                .foregroundColor(.white)
                
            }
            .offset(CGSize(width: 0, height: -75))
            ScrollView(.vertical, showsIndicators: false) {
                VStack(alignment: .leading, spacing: 18.0) {
                    HStack {
                        Text("糖醋排骨")
                            .font(.title)
                            
                        Image(systemName: "bookmark.fill")
                    }
                    .padding(.horizontal)
                    HStack{
                        Image(systemName: "chevron.up")
                        Text("难度等级(初级) ｜ ")
                        Image(systemName: "stopwatch")
                        Text("时长10—30分钟")
                        Spacer()
                    }
                    .padding(.horizontal)
                    HStack {
                        Text("食材清单")
                        Spacer()
                        Text("共六种")
                    }
                    .padding(.horizontal)
                    RoundedRectangle(cornerRadius: 5)
                        .fill(Color.white)
                        .frame(width: UIScreen.main.bounds.width-30, height: 300)
                        .padding(.horizontal)
                    HStack {
                        Text("制作步骤")
                        Spacer()
                        Text("共两种")
                    }
                    .padding(.horizontal)
                }
            }
        }
        .background(Color.Neumorphic.main.ignoresSafeArea())
        .navigationBarBackButtonHidden(true)
        .navigationBarHidden(true)
    }
}

struct CoolVideo_Previews: PreviewProvider {
    static var previews: some View {
        CoolVideo()
    }
}
