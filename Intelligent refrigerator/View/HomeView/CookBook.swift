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
    @State var isshowvideo=false
    @State var navtoCookBook=false
    var body: some View {
        VStack {
            ZStack {
                HStack {
                    Button(action: {
                        presentationMode.wrappedValue.dismiss()
                    }, label: {
                        Image(systemName: "house")
                            .imageScale(.large)
                    })
                    Spacer()
                }
                Text("菜谱")
                    .font(.title2)
            }.foregroundColor(.gray)
                .padding(.horizontal)
            ScrollView(.vertical, showsIndicators: false) {
                VStack(spacing: 20.0) {
                    ZStack {
                        RoundedRectangle(cornerRadius: 25.0)
                            .fill(Color.Neumorphic.main)
                            .softOuterShadow()
                            .frame(width: UIScreen.main.bounds.width - 30, height: 40, alignment: .center)
                        HStack {
                            Image(systemName: "magnifyingglass").foregroundColor(.white)
                            Text("请输入食材").foregroundColor(.gray)
                            Spacer()
                        }
                        .padding(.all, 30)
                    }
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack {
                            ForEach(0..<10, id: \.self) { _ in
                               NavigationLink(
                                destination: QuickerCook(),
                                isActive: $navtoCookBook,
                                label: {
                                    CookCircleButton(isshow: $navtoCookBook, image: "cc", title: "快手菜", size: 150).padding()
                                })              // 跳转到菜谱
                            }
                        }
                    }

                    BanderCook(isshowVideo: $isshowvideo)
                    BanderCook(isshowVideo: $isshowvideo,title: "收藏菜谱", sizebig: 150, sizesmall: 60)
                    BanderCook(isshowVideo: $isshowvideo,title: "热门菜谱", sizebig: 150, sizesmall: 60)
                }
            }
            .navigationBarTitle(Text("菜谱"), displayMode: .inline)
            .navigationBarItems(trailing: Button(action: {}, label: {
                Image(systemName: "")
                    .imageScale(.large)
            }))
        }
        .background(Color.Neumorphic.main.ignoresSafeArea())
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
    }
}

struct CookCircleButton: View {
    @Binding var isshow:Bool
    var image="cc"
    var title="接听"
    var size: CGFloat=100
    var body: some View {
        VStack(alignment: .center) {
                    Button(action: {
                        self.isshow.toggle()
                    }, label: {
                        VStack {
                            Image(image)
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 150, height: 150, alignment: .center)
                                .clipShape(Circle())
                        }.frame(width: size, height: size, alignment: .center)
                    }).softButtonStyle(Circle())
            Text(title).foregroundColor(.gray)
        }
    }
}

struct BanderCook: View {
    @Binding var isshowVideo:Bool
    var image="perch"
    var icon=""
    var title="今日菜谱"
    var sizebig: CGFloat=250
    var sizesmall: CGFloat=250
    var body: some View {
        VStack {
            HStack {
                Text("\(title)")
                    .font(.title)
                Spacer()
                Image(systemName: "\(icon)")
            }
            .padding(.horizontal)
            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    ForEach(0..<5, id: \.self) { _ in
                        NavigationLink(
                            destination: CoolVideo(),
                            isActive: $isshowVideo,
                            label: {
                                Button(action: {
                                    self.isshowVideo.toggle()
                                }, label: {
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
                                })
                               
                            })
                    }
                    .padding()
                }
            }
        }
    }
}

struct CookBook_Previews: PreviewProvider {
    static var previews: some View {
        CookBook().preferredColorScheme(/*@START_MENU_TOKEN@*/ .dark/*@END_MENU_TOKEN@*/)
    }
}
