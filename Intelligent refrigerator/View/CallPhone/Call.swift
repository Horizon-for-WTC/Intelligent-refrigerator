//
//  Call.swift
//  Intelligent refrigerator
//
//  Created by cjj on 2021/3/4.
//

import SwiftUI

struct Call: View {
    @Environment(\.presentationMode) var presentationMode
    var body: some View {
        VStack(spacing: 20.0) {
            ZStack {
                HStack {
                    Image(systemName: "house")
                        .imageScale(.large)
                    Spacer()
                }
                
                Text("正在呼叫...")
                    .font(.title2)
            }
            .foregroundColor(.white)
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
                Text("正在Wi-Fi通话，通话完全免费")
            } .foregroundColor(.white)
            Spacer()  
            HStack(alignment: .center, spacing: 60.0){
                Spacer()
                CircleButton(image: "mic.slash", title: "静音", size: 80)
                CircleButton(image: "keyboard", title: "键盘", size: 80)
                CircleButton(image: "speaker.wave.2.circle", title: "免提", size: 80)
                Spacer()
            }
            CircleButton(image: "phone.circle.fill", title: "挂断", size: 80).padding(.vertical,30)
            Spacer()
        }
       
        .background(Color.gray.ignoresSafeArea())
    }
}

struct Call_Previews: PreviewProvider {
    static var previews: some View {
        Call()
    }
}
