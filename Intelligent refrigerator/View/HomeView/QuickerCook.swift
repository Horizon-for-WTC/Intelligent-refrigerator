//
//  QuickerCook2.swift
//  Intelligent refrigerator
//
//  Created by 陈佳俊 on 2021/3/10.
//

import SwiftUI
import WaterfallGrid
struct QuickerCook: View {
    var body: some View {
        ZStack {
            Color.Neumorphic.main.ignoresSafeArea()
            VStack {
                ZStack {
                    HStack {
                        Image(systemName: "house")
                            .imageScale(.large)
                        Spacer()
                        Image(systemName: "mic.fill")
                            .imageScale(.large)
                    }
                    Text("快手菜")
                        .font(.title2)
                }
                .foregroundColor(.gray)
                .padding(.horizontal)
                ScrollView {
                    WaterfallGrid((0..<10), id: \.self) { index in
                        Cookmenu().padding()
                    }
                }
            }
        }
}}
struct Cookmenu:View {
    var image="cc"
    var title="可乐鸡翅"
    var subtitle="可乐，鸡翅，料酒，生姜，盐"
    var time="预计10-30分钟"
    var people="1233人做过"
    var body: some View{
        VStack(alignment: .leading, spacing: 0.0){
            ZStack{
                VStack (alignment: .leading, spacing: 0.0){
                    Image("\(image)")
                        .resizable()
                        .frame(width: 380, height: 180, alignment: .center)
                    VStack(alignment: .leading, spacing: 8.0) {
                        HStack {
                            Text("\(title)")
                                .font(.title2)
                            Spacer()
                            Image(systemName: "bookmark")
                        }
                        Text("\(subtitle)")
                        HStack{
                            Image(systemName: "stopwatch")
                            Text("\(time)")
                        }
                        HStack{
                            Image(systemName: "person.fill")
                            Text("\(people)")
                        }
                    }
                    .padding(.horizontal)
                    .frame(width: 380, height: 150, alignment: .leading)
                    .background(Color("Background"))
                }
            }
            .clipShape(RoundedRectangle(cornerRadius: 15))
            .softOuterShadow()
            
        }
    }
}

struct QuickerCook_Previews: PreviewProvider {
    static var previews: some View {
        QuickerCook().preferredColorScheme(.light)
    }
}
