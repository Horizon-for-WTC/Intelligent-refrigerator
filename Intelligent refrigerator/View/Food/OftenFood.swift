//
//  OftenFood.swift
//  Intelligent refrigerator
//
//  Created by cjj on 2021/3/4.
//

import SwiftUI

struct OftenFood: View {
    @Environment(\.presentationMode) var presentationMode
    @State var isshowAdd=false
    @State var isshowmessge=false
    var body: some View {
        ZStack {
            VStack {
                ZStack {
                    HStack {
                        Image(systemName: "house")
                            .imageScale(.large)
                        Spacer()
                        Menu {
                            VStack{
                                Button(action: {self.isshowAdd=true}, label: {
                                    Text("手动添加")
                                })
                                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                                    Text("语音添加")
                                })
                                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                                    Text("小票识别")
                                })
                            }
                        } label: {
                            Image(systemName: "house")
                                .imageScale(.large)
                        }

                    }
                    .padding(.horizontal)
                    Text("食品管理")
                        .font(.title2)
                }
                ZStack {
                    RoundedRectangle(cornerRadius: 25.0)
                        .stroke(Color.white)
                        .frame(width: UIScreen.main.bounds.width-60, height: 30)
                        
                    HStack{
                        Circle().fill(Color.red)
                            .frame(width: 10, height: 10)
                        Text("已过期")
                        Circle().fill(Color.yellow)
                            .frame(width: 10, height: 10)
                        Text("即将过期")
                        Circle().fill(Color.green)
                            .frame(width: 10, height: 10)
                        Text("新鲜")
                        Spacer()
                        Circle().fill(Color.white)
                            .frame(width: 10, height: 10)
                        Text("长按删除食材")
                    }
                   
                    .padding(.horizontal, 50)
                }
                Spacer()
            }
            .background(Color.gray.ignoresSafeArea())
            .blur(radius: isshowAdd ? 10 : 0)
            
            if isshowAdd{
                AddFood()
            }
        }
    }
}

struct OftenFood_Previews: PreviewProvider {
    static var previews: some View {
        OftenFood()
    }
}
