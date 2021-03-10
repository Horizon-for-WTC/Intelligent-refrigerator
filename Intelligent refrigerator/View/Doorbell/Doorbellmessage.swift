//
//  Doorbellmessage.swift
//  Intelligent refrigerator
//
//  Created by cjj on 2021/3/4.
//

import SwiftUI

struct Doorbellmessage: View {
    @Environment(\.presentationMode) var presentationMode
    var body: some View {
        ZStack {
            Color.Neumorphic.main.ignoresSafeArea()
            ZStack (alignment:.leading){
                RoundedRectangle(cornerRadius: 10)
                    .fill(Color.Neumorphic.main)
                    .softOuterShadow()
                    .frame(width: UIScreen.main.bounds.width-60, height:350,alignment: .center)
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
                                .font(.title)
                                .padding(.horizontal,20)
                                
                        }).softButtonStyle(Rectangle())
                        Spacer()
                        Text("|")
                            .font(.title)
                        Spacer()
                        Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                            Text("确定")
                                .font(.title)
                                .padding(.horizontal,20)
                               
                        }).softButtonStyle(Rectangle())
                        Spacer()
                    }
                }.foregroundColor(.gray)
                .padding()
                .frame(width: UIScreen.main.bounds.width-60, alignment: .center)
            }
           
        }
        
    }
}

struct Doorbellmessage_Previews: PreviewProvider {
    static var previews: some View {
        Doorbellmessage().preferredColorScheme(.dark)
    }
}
