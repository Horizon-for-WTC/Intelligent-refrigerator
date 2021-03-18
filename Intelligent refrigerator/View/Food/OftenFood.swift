//
//  OftenFood.swift
//  Intelligent refrigerator
//
//  Created by 陈佳俊 on 2021/3/9.
//

import Neumorphic
import SwiftUI
struct OftenFood: View {
    @Environment(\.presentationMode) var presentationMode
    @State var isshowAdd=false
    @State var isshowmessge=false
//    @State var we=false
    var body: some View {
            ZStack {
                VStack {
                    //头部
                    ZStack {
                        HStack {
                            Button(action: {
                                presentationMode.wrappedValue.dismiss()
                            }, label: {
                                Image(systemName: "house")
                                    .imageScale(.large)
                            })
                            Spacer()
                            Menu {
                                VStack {
                                    Button(action: { self.isshowAdd=true }, label: {
                                        Text("手动添加")
                                    })
                                    Button(action:  {}, label: {
                                        Text("语音添加")
                                    })
                                    Button(action:  {}, label: {
                                        Text("小票识别")
                                    })
                                }
                            } label: {
                                Image(systemName: "slider.horizontal.3")
                                    .imageScale(.large)
                            }
                        }
                        .padding(.horizontal)
                        Text("食品管理")
                            .font(.title2)
                    }.foregroundColor(.gray)
                    //分类
                   
                    ZStack {
                        RoundedRectangle(cornerRadius: 20)
                            .fill(Color.Neumorphic.main)
                            .softOuterShadow()
                            .frame(width: UIScreen.main.bounds.width - 60, height: 30)
                        HStack {
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
                        }.foregroundColor(.gray)

                            .padding(.horizontal, 50)
                    }.padding(.vertical)
                    //分类冰箱
                    FoodClass()
                    Spacer()
                }
                .background(Color.Neumorphic.main.ignoresSafeArea())
                .blur(radius: isshowAdd ? 10 : 0)

                if isshowAdd {
                    AddFood(isshow: $isshowAdd)
                }
            }.navigationBarBackButtonHidden(true).navigationBarHidden(true)
    }
}

struct FoodClass:View {
    @State var index = 0
    var colors:[Color] = [.red,.yellow,.green]
    var body: some View{
            VStack{
                HStack(spacing: 50.0){
                    ZStack{
                        Capsule().fill(colors[index]).frame(width: 100, height: 40, alignment: .center)
                            .offset(x: CGFloat(150*index), y: 0)
                        Button(action: {
                            self.index=0
                        }, label: {
                            Text("已过期")
                        }).frame(width: 100, height: 40, alignment: .center)
                    }
                    Button(action: {
                        self.index=1
                    }, label: {
                        Text("快过期")
                    }).frame(width: 100, height: 40, alignment: .center)
                    Button(action: {
                        self.index=2
                    }, label: {
                        Text("新鲜")
                    }).frame(width: 100, height: 40, alignment: .center)
                }.foregroundColor(.gray)
                TabView(selection: $index){
                    Image("过期").resizable().tag(0).background(Color.Neumorphic.main).ignoresSafeArea(edges: .bottom)
                    Image("临期").resizable().tag(1).background(Color.Neumorphic.main).ignoresSafeArea()
                    Image("新鲜").resizable().tag(2).background(Color.Neumorphic.main).ignoresSafeArea()
                }.tabViewStyle(PageTabViewStyle(indexDisplayMode: PageTabViewStyle.IndexDisplayMode.never))
            }.background(Color.Neumorphic.main.ignoresSafeArea())
    }
}
struct OftenFood_Previews: PreviewProvider {
    static var previews: some View {
        OftenFood()
    }
}

