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
    @State var isshowvideo0=false
    @State var isshowvideo1=false
    @State var isshowvideo2=false
    @State var navtoCookBook=false
    var body: some View {
        VStack {
            // 头部菜单
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
                VStack(spacing: 30.0) {
                    ZStack {
                        // 搜素
                        RoundedRectangle(cornerRadius: 25.0)
                            .fill(Color.Neumorphic.main)
                            .softOuterShadow()
                            .frame(width: UIScreen.main.bounds.width - 40, height: 40, alignment: .center)
                        HStack {
                            Image(systemName: "magnifyingglass").foregroundColor(.white)
                            Text("请输入食材").foregroundColor(.gray)
                            Spacer()
                        }
                        .padding(.all, 30)
                    }

                    // 菜谱

//                  BanderCook(isshowVideo: $isshowvideo)
                    Recommend(isshow1: $isshowvideo0, isshow2: $isshowvideo1, isshow3: $isshowvideo2)
                    BanderCook(isshowVideo: $isshowvideo, title: "收藏菜谱", sizebig: 150, sizesmall: 60)
                    BanderCook(isshowVideo: $isshowvideo, title: "热门菜谱", sizebig: 150, sizesmall: 60)
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
    @Binding var isshow: Bool
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
    @Binding var isshowVideo: Bool
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
            .padding(.horizontal, 25)
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
            }.padding()
        }
    }
}

struct Recommend: View {
    @Binding var isshow1: Bool
    @Binding var isshow2: Bool
    @Binding var isshow3: Bool
    @State var index=0 // 位移的下标
    var body: some View {
        VStack {
            HStack(spacing: 20.0) {
                Text("今日菜谱")
                    .font(.title)
                    .padding(.trailing, 30.0)
                ZStack {
                    Capsule().fill(Color.gray).frame(width: 80, height: 40, alignment: .center).offset(x: CGFloat(100 * index), y: 0)
                    Button(action: {
                        self.index=0
                    }, label: {
                        Text("早餐")
                    }).frame(width: 80, height: 40, alignment: .center)
                }
                Button(action: {
                    self.index=1
                }, label: {
                    Text("午餐")
                }).frame(width: 80, height: 40, alignment: .center)
                Button(action: {
                    self.index=2
                }, label: {
                    Text("晚餐")
                }).frame(width: 80, height: 40, alignment: .center)
                Spacer()
            }
            .padding(.horizontal, 20.0)
            .foregroundColor(.white)
            TabView(selection: $index) {
                RecommendBander(isshowVideo: $isshow1).tag(0)
                RecommendBander(isshowVideo: $isshow2).tag(1)
                RecommendBander(isshowVideo: $isshow3).tag(2)
            }.tabViewStyle(PageTabViewStyle(indexDisplayMode: PageTabViewStyle.IndexDisplayMode.never)).frame(width: UIScreen.main.bounds.width, height: 250, alignment: .center)
        }
        .frame(width: UIScreen.main.bounds.width, height: 300, alignment: .center)
    }
}

struct RecommendBander: View {
    @Binding var isshowVideo: Bool
    var image="perch"
    var sizebig: CGFloat=230
    var sizesmall: CGFloat=230
    var body: some View {
        HStack {
            ForEach(0..<3, id: \.self) { _ in
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
            .padding(.horizontal)
        }
    }
}

struct CookBook_Previews: PreviewProvider {
    static var previews: some View {
        CookBook().preferredColorScheme(.dark)
    }
}
