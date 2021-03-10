//
//  Doorbell.swift
//  Intelligent refrigerator
//
//  Created by cjj on 2021/3/4.
//phone.down.fill phone.fill mic.fill

import SwiftUI

struct Doorbell: View {
    @Environment(\.presentationMode) var presentationMode
    var body: some View {
            VStack {
                ZStack {
                    HStack {
                        Button(action: {
                        presentationMode.wrappedValue.dismiss()
                    }, label: {
                        Image(systemName: "house")
                            .imageScale(.large)
                    })
                        Spacer()
                    }
                    Text("智能门铃")
                        .font(.title2)
                }
                .foregroundColor(.gray)
                .padding(.horizontal)
                    VStack{
                        Spacer()
                        Text("有人在按门铃,等待接听...")
                            .foregroundColor(.gray)
                        Image("cc")
                            .resizable()
                            .frame(width: 120, height: 120)
                            .aspectRatio(contentMode: .fill)
                            .clipShape(Circle())
                        Spacer()
                        HStack(spacing: 100.0){
                            ForEach(0..<3, id: \.self) { value  in
                                CircleButton()
                            }
                        }
                        .padding(.bottom, 30.0)
                    }
            }
            .background(Color.Neumorphic.main.ignoresSafeArea())
            .navigationBarBackButtonHidden(true)
            .navigationBarHidden(true)
    }
}

struct CircleButton:View {
    var image="mic.fill"
    var title="接听"
    var size:CGFloat=60
    var body: some View{
        VStack(alignment: .center) {
            Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                    VStack {
                        Image(systemName: image)
                            .aspectRatio(contentMode: .fit)
                            .font(.system(size: 48))
                            .foregroundColor(Color.white.opacity(0.4))
                    }.frame(width: size, height: size, alignment: .center)
            }).softButtonStyle(Circle())
            Text(title).foregroundColor(.gray)
        }
    }
}

struct Doorbell_Previews: PreviewProvider {
    static var previews: some View {
        Doorbell().preferredColorScheme(.dark)
    }
}
