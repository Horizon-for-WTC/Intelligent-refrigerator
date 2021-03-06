//
//  Doorbellmessage.swift
//  Intelligent refrigerator
//
//  Created by cjj on 2021/3/4.
//

import SwiftUI

struct Doorbellmessage: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 20.0){
            Text("语音回复")
                .font(.title)
            Text("主人不在家,请把物品放在门口,谢谢")
            Text("主人不在家,他稍后联系您")
            Text("主人已录制报警,请马上离开")
            Text("自定义...")
            Divider()
                
            HStack{
                Spacer()
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                    Text("取消")
                        .foregroundColor(.black)
                })
                Spacer()
                Text("|")
                    .foregroundColor(.gray)
                    .font(.title)
                Spacer()
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                    Text("确定")
                        .foregroundColor(.black)
                })
                Spacer()
            }
        }
        .padding()
        .frame(width: UIScreen.main.bounds.width-60, alignment: .center)
        .background(Color.white)
        .clipShape(RoundedRectangle(cornerRadius: 15))
        
    }
}

struct Doorbellmessage_Previews: PreviewProvider {
    static var previews: some View {
        Doorbellmessage()
    }
}
