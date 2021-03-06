//
//  CookBook.swift
//  Intelligent refrigerator
//
//  Created by cjj on 2021/3/2.
// foreach 便利数据元

import SwiftUI

struct CookBook: View {
    var body: some View {
            ScrollView(.vertical, showsIndicators: false){
                VStack(spacing: 20.0) {
                    Capsule()
                        .fill(Color.gray)
                        .frame(width: UIScreen.main.bounds.width-30, height: 36, alignment: .center)
                    Circlestyle()
                    BanderCook()
                    BanderCook(title: "收藏菜谱", size: 150)
                    BanderCook(title: "热门菜谱", size: 150 )
                }
            }
            .navigationBarTitle(Text("菜谱"), displayMode: .inline)
            .navigationBarItems(trailing: Button(action: {}, label: {
                Image(systemName: "")
                    .imageScale(.large)
            }))
    }
}

struct Circlestyle:View {
    var image="cc"
    var body: some View{
        VStack{
            ScrollView(.horizontal, showsIndicators:false) {
                HStack(spacing: 10.0) {
                    ForEach(0..<8, id: \.self) { value in
                            VStack {
                                Image("\(image)")
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: 100, height: 100)
                                    .clipShape(Circle())
                                Text("\(value)")
                            }
                    }
                }
            }
          
        }
        .padding(.horizontal)
    }
}

struct BanderCook:View{
    var image="cc"
    var icon=""
    var title="今日菜谱"
    var size:CGFloat=250
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
                        Image("\(image)")
                            .resizable()
                            .frame(width: size, height: size, alignment: .center)
                            .aspectRatio(contentMode: .fill)
                    }
                    .padding()
                }
            }
        }
    }
}

struct CookBook_Previews: PreviewProvider {
    static var previews: some View {
        CookBook()
    }
}
