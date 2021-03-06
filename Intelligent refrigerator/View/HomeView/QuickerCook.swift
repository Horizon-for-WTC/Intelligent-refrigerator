//
//  QuickerCook.swift
//  Intelligent refrigerator
//
//  Created by cjj on 2021/3/2.
//

import SwiftUI

struct QuickerCook: View {
    @Environment(\.presentationMode) var presentationMode
    let columns=[GridItem(.adaptive(minimum: UIScreen.main.bounds.width/3))]
    var body: some View {
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
            .foregroundColor(.white)
            .padding(.horizontal)
            ScrollView {
                    LazyVGrid(columns: columns) {
                        ForEach(0..<6) { item in
                            Cookmenu()
                        }
                    }
                }
        }.background(Color.gray.ignoresSafeArea(.all))
    }
}

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
                        .frame(width: 350, height: 180, alignment: .center)
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
                    .padding(.horizontal, 5.0)
                    .frame(width: 350, height: 150, alignment: .leading)
                    .background(Color.white)
                }
            }
            .clipShape(RoundedRectangle(cornerRadius: 15))
        }
    }
}
struct QuickerCook_Previews: PreviewProvider {
    static var previews: some View {
        QuickerCook()
    }
}
