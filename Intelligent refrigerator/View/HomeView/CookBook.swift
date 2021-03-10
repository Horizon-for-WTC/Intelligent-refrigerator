//
//  CookBook.swift
//  Intelligent refrigerator
//
//  Created by cjj on 2021/3/2.
// foreach 便利数据元

import SwiftUI
import SwiftUIX
struct CookBook: View {
    @Environment(\.presentationMode) var presentationMode
    var body: some View {
        VStack {
            ZStack {
                HStack {
                    Image(systemName: "house")
                        .imageScale(.large)
                    Spacer()
                }
                Text("菜谱")
                    .font(.title2)
            }.foregroundColor(.gray)
            .padding(.horizontal)
            ScrollView(.vertical, showsIndicators: false){
                    VStack(spacing: 20.0) {
                        ZStack {
                            RoundedRectangle(cornerRadius: 25.0)
                                .fill(Color.Neumorphic.main)
                                .softOuterShadow()
                                .frame(width: UIScreen.main.bounds.width-30, height: 40, alignment: .center)
                            HStack{
                                Image(systemName: "magnifyingglass").foregroundColor(.white)
                                Text("请输入食材").foregroundColor(.gray)
                                Spacer()
                            }
                            .padding(.all,30)
                        }
                        ScrollView(.horizontal, showsIndicators: false){
                        HStack {
                            ForEach(0..<10, id: \.self) { _ in
                                CookCircleButton(image: "cc", title: "鱼香肉丝", size: 60)
                            }
                        }
                        }
                        
                        BanderCook()
                        BanderCook(title: "收藏菜谱",sizebig: 150,sizesmall: 60)
                        BanderCook(title: "热门菜谱",sizebig: 150,sizesmall: 60)
                       
                    }
                }
                .navigationBarTitle(Text("菜谱"), displayMode: .inline)
                .navigationBarItems(trailing: Button(action: {}, label: {
                    Image(systemName: "")
                        .imageScale(.large)
            }))
        }.background(Color.Neumorphic.main.ignoresSafeArea())
    }
}

struct CookCircleButton:View {
    var image="mic.fill"
    var title="接听"
    var size:CGFloat=60
    var body: some View{
        VStack(alignment: .center) {
            Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                    VStack {
                        Image(image)
                            .aspectRatio(contentMode: .fit)
                            .font(.system(size: 60))
                            .clipShape(Circle())
                            .foregroundColor(Color.white.opacity(0.4))
                    }.frame(width: size, height: size, alignment: .center)
            }).softButtonStyle(Circle())
            Text(title).foregroundColor(Color.gray)
        }
    }
}

struct BanderCook:View{
    var image="perch"
    var icon=""
    var title="今日菜谱"
    var sizebig:CGFloat=250
    var sizesmall:CGFloat=250
    var body: some View{
        VStack{
            HStack{
                Text("\(title)")
                    .font(.title)
                Spacer()
                Image(systemName: "\(icon)")
            }
            .padding(.horizontal)
            ScrollView(.horizontal, showsIndicators: false){
                HStack {
                    ForEach(0..<5, id: \.self) { value in
                        ZStack {
                            Rectangle()
                                .fill(Color.Neumorphic.main)
                                .frame(width: sizebig, height: sizebig, alignment: .center)
                                .softOuterShadow()
                            Image("\(image)")
                                .resizable()
                                .frame(width: sizesmall, height: sizesmall, alignment: .center)
                                .aspectRatio(contentMode: .fill)
                        }
                            
                    }
                    .padding()
                }
            }
        }
    }
}

struct CookBook_Previews: PreviewProvider {
    static var previews: some View {
        CookBook().preferredColorScheme(/*@START_MENU_TOKEN@*/.dark/*@END_MENU_TOKEN@*/)
    }
}
