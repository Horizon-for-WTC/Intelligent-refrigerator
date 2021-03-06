//
//  Cookserch.swift
//  Intelligent refrigerator
//
//  Created by cjj on 2021/3/3.
//

import SwiftUI

struct Cookserch: View {
    var body: some View {
        VStack {
            Text("历史查找")
                .font(.title)
            Divider()
                .frame(width: UIScreen.main.bounds.width-60)
            Text("鱼香肉丝")
            Text("干煸土豆丝")
            Text("红烧狮子头")
            Text("脆皮鸭")
            Spacer()
            Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                VStack {
                    Image(systemName: "mic.fill")
                        .font(.title)
                        .imageScale(.large)
                    Text("语音查找")
                }
                .foregroundColor(.white)
            })
            .frame(width: 100, height: 100, alignment: .center)
            .background(Color.gray)
            .clipShape(Circle())
            Text("切换文字查找")
                .padding()
        }
        
        .navigationBarTitle("查找菜谱", displayMode: .inline)
    }
}

struct Cookserch_Previews: PreviewProvider {
    static var previews: some View {
        Cookserch()
    }
}
