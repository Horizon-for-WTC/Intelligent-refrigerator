//
//  Call.swift
//  Intelligent refrigerator
//
//  Created by cjj on 2021/3/4.
//

import SwiftUI

struct Call: View {
    var body: some View {
        VStack(spacing: 20.0) {
            ZStack {
                HStack {
                    Image(systemName: "house")
                        .imageScale(.large)
                    Spacer()
                }
                .padding()
                Text("正在呼叫...")
                    .font(.title2)
            }
            Spacer()
            VStack(spacing: 8.0) {
                Image("cc")
                    .resizable()
                    .frame(width: 120, height: 120)
                    .aspectRatio(contentMode: .fill)
                    .clipShape(Circle())
                Text("176 8377 0064")
                    .foregroundColor(.black)
                    .font(.title2)
                Text("正在Wi-Fi通话，通话完全免费")
            }
            Spacer()  
            HStack(alignment: .center, spacing: 60.0){
                Spacer()
                CircleButton(image: "phone.down.circle.fill", title: "静音", size: 80)
                CircleButton(image: "phone.circle.fill", title: "键盘", size: 80)
                CircleButton(image: "phone.circle.fill", title: "免提", size: 80)
                Spacer()
            }
            CircleButton(image: "phone.circle.fill", title: "挂断", size: 80)
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
