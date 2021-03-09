//
//  AddFood.swift
//  Intelligent refrigerator
//
//  Created by 陈佳俊 on 2021/3/9.
//

import SwiftUI
import Neumorphic
struct AddFood: View {
    @State var num=0
    @Binding var isshow:Bool
    @Environment(\.presentationMode) var presentationMode
    var body: some View {
        ZStack {
            
            RoundedRectangle(cornerRadius: 18)
                .fill(Color.Neumorphic.main)
                .softOuterShadow()
                .frame(width: UIScreen.main.bounds.width-50, height: UIScreen.main.bounds.height/2.2, alignment: .center)
            VStack(spacing: 20.0) {
                Text("请确定添加的食材")
                RoundedRectangle(cornerRadius: 10)
                    .fill(Color.black.opacity(0.6))
                    .frame(width: 80, height: 80, alignment: .center)
                    .softOuterShadow()
                Text("火龙果")
                Text("将于2020年10月26日过期")
                Rectangle()
                    .fill(Color.gray)
                    .frame(width: UIScreen.main.bounds.width-100, height: 1, alignment: .center)
                ZStack {
                    Stepper(value: $num, in: 1...10) {
                        Text("期限(天)")
                    }
                    .padding(.horizontal, 50.0)
                    HStack {
                        Spacer()
                        Text("\(num)").padding(.horizontal, 90)
                    }
                }
                HStack(spacing: 10.0){
                    CJJNeumorphicBut(width: (UIScreen.main.bounds.width-50)/5, height: 80, str: "一周")
                    CJJNeumorphicBut(width: (UIScreen.main.bounds.width-50)/5, height: 80, str: "一个月")
                    CJJNeumorphicBut(width: (UIScreen.main.bounds.width-50)/5, height: 80, str: "两个月")
                    CJJNeumorphicBut(width: (UIScreen.main.bounds.width-50)/5, height: 80, str: "三个月")
                    CJJNeumorphicBut(width: (UIScreen.main.bounds.width-50)/5, height: 80, str: "半年")
                }
                .padding(.horizontal)
                HStack(spacing: 30.0){
                    Button(action: {
                        self.isshow.toggle()
                    }, label: {
                        Text("取消")
                                .padding(.horizontal,100)
                    }).softButtonStyle(Rectangle())
                    Button(action: {
                        self.isshow.toggle()
                    }, label: {
                         Text("确定")
                            .padding(.horizontal,100)
                    }).softButtonStyle(Rectangle())
                   
                }
                .font(.title)
                .padding()
            }
        }
    }
}

struct CJJNeumorphicBut:View {
    var width:CGFloat
    var height:CGFloat
    var str:String
    var body: some View{
        Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
            Text("\(str)").font(.title).padding(5.0)
        }).softButtonStyle(RoundedRectangle(cornerRadius: 10)).frame(max: CGSize(width: width, height: height))
    }
}

struct AddFood_Previews: PreviewProvider {
    static var previews: some View {
        AddFood(isshow: OftenFood().$isshowAdd)
    }
}
