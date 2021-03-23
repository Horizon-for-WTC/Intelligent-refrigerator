//
//  Answer.swift
//  Intelligent refrigerator
//
//  Created by cjj on 2021/3/4.
//

import SwiftUI

struct Answer: View {
    @Environment(\.presentationMode) var presentationMode
    var body: some View {
        VStack {
            ZStack {
                HStack {
                    Image(systemName: "house")
                        .imageScale(.large)
                    Spacer()
                }
                Text("来电")
                    .font(.title2)
            }.foregroundColor(.white)
            .padding(.horizontal)
            Spacer()
            VStack(spacing: 8.0) {
                Image("cc")
                    .resizable()
                    .frame(width: 120, height: 120)
                    .aspectRatio(contentMode: .fill)
                    .clipShape(Circle())
                Text("176 8377 0064")
                    .font(.title2)
                Text("湖北武汉")
            }.foregroundColor(.white)
            Spacer()
            HStack{
                Spacer()
                CircleButton(image: "phone.down.circle.fill", title: "接听", size: 80)
                Spacer()
                CircleButton(image: "phone.circle.fill", title: "挂断", size: 80)
                Spacer()
            }
            Spacer()
        }.background(Color.gray.ignoresSafeArea())
    }
}

struct CircleButton:View {
    var image="mic.fill"
    var title="接听"
    var size:CGFloat=60
    var body: some View{
        VStack(alignment: .center) {
            Button(action: {
                print("anxia yuananniu")
            }, label: {
                VStack {
                    Image(systemName: image)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .font(.system(size: 48))
                        .foregroundColor(Color.white.opacity(0.4))
                }.frame(width: size, height: size, alignment: .center)
            }).softButtonStyle(Circle())
            Text(title).foregroundColor(.gray)
        }
    }
}

struct Answer_Previews: PreviewProvider {
    static var previews: some View {
        Answer()
    }
}
