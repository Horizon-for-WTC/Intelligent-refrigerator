//
//  Cookserch.swift
//  Intelligent refrigerator
//
//  Created by cjj on 2021/3/3.
//

import SwiftUI

struct Cookserch: View {
    @Environment(\.presentationMode) var presentationMode
    var body: some View {
        VStack(spacing: 15.0) {
            ZStack {
                HStack {
                    Button(action: {}, label: {
                        Image(systemName: "chevron.backward")
                    })
                    
                    Spacer()
                }
                .padding(.horizontal)
                Text("查找菜谱")
                    .font(.title)
            }
            Text("历史查找")
                .font(.title)
            Divider()
                .frame(width: UIScreen.main.bounds.width - 60)
            Text("鱼香肉丝")
            Text("干煸土豆丝")
            Text("红烧狮子头")
            Text("脆皮鸭")
            Spacer()
            CircleButton(title: "语音查找")
                
            Text("切换文字查找")
                .padding()
        }
        .foregroundColor(.gray)
        .background(Color.Neumorphic.main.ignoresSafeArea())
        .navigationBarTitle("查找菜谱", displayMode: .inline)
    }
}

struct Cookserch_Previews: PreviewProvider {
    static var previews: some View {
        Cookserch().preferredColorScheme(.dark)
    }
}
