//
//  HomepageView.swift
//  Intelligent refrigerator
//
//  Created by 陈佳俊 on 2021/3/9.
//

import SwiftUI

struct HomepageView: View
{
    var formater: DateFormatter
    {
        let dataformatter=DateFormatter()
        dataformatter.dateFormat="HH:mm"
        return dataformatter
    } // 时间格式
    var formater2: DateFormatter
    {
        let dataformatter=DateFormatter()
        dataformatter.dateFormat="MM月dd日 | EEEE"
        return dataformatter
    } // 日期格式
    @State var stardmusic=0.0 // 音乐默认起始时间
    @State var endmusic=3.0 // 音乐结束时间
    @State var isplay=false // 音乐是否播放
    @State var isstr=0 // 判断留言数量是否为空
    @State var navtoFood=false // 跳转到食物
    @State var navtoFoodmessage=false // 跳转到食物信息
    @State var navtoDoorbell=false
    @State var navtoCookBook=false
    @State var navtoCookVideo=false
    @State var navtoThermostat=false
//    @Binding var isshowFoodLable:Bool
    var foods=["西红柿", "生菜", "火龙果"] // 过期或临期食物数组     内容为过期时间最长的三个
    var gl=["假日", "节能", "速冻", "速冷", "智能"]
    var body: some View
    {
        NavigationView
        {
            ZStack
            {
                Color.Neumorphic.main.ignoresSafeArea()
                VStack
                {
                    // 头部时间区域
                    HStack(alignment: .bottom, spacing: 8.0)
                    {
                        VStack(alignment: .leading)
                        {
                            Text(Date() as NSObject, formatter: formater)
                                .font(.system(size: 75))
                                .fontWeight(.semibold)
                            // 时间
                            Text(Date(), formatter: formater2)
                                .font(.system(size: 23))
                                .padding(.horizontal) // 日期
                        }
                        VStack
                        {
                            Image(systemName: "drop.fill")
                                .resizable()
                                .frame(width: 30, height: 50) // 天气
                            Text("20℃") // 温度
                                .font(.system(size: 20))
                                .padding(.top)
                        }
                        Spacer()
                    }
                    .padding(.horizontal, 30.0)
                    // 底部功能区域
                    HStack(alignment: .top, spacing: 15.0)
                    { // 左侧
                        VStack(spacing: 10.0)
                        {
                            // 菜谱功能
                            ZStack
                            {
                                RoundedRectangle(cornerRadius: 10)
                                    .fill(Color.Neumorphic.main)
                                    .frame(width: UIScreen.main.bounds.width/2-40, height: 450)
                                    .softOuterShadow()
                                
                                VStack
                                {
                                    NavigationLink(
                                        destination: CookBook(),
                                        isActive: $navtoCookBook,
                                        label: {
                                            Button(action: { self.navtoCookBook.toggle() }, label: {
                                                HStack
                                                {
                                                    Text("菜谱推荐")
                                                        .foregroundColor(.white)
                                                        .font(.custom("", fixedSize: 40))
                                                    Spacer()
                                                }
                                                .padding()
                                            })
                                        })
                                    
                                    // 点击菜谱跳转到对应页面
                                    NavigationLink(
                                        destination: CoolVideo(),
                                        isActive: $navtoCookVideo,
                                        label: {
                                            Button(action: {
                                                self.navtoCookVideo.toggle()
                                            }, label: {
                                                Image("4") // 菜谱图片 跟换名字达到轮播图效果
                                                    .resizable()
                                                    .aspectRatio(contentMode: .fit)
                                                    .frame(width: 300, height: 300)
                                            })
                                        })
                                }
                                .frame(width: UIScreen.main.bounds.width/2-40, height: 450)
                            }
                            
                            // 留言板功能
                            ZStack
                            {
                                RoundedRectangle(cornerRadius: 10)
                                    .fill(Color.Neumorphic.main)
                                    .frame(width: UIScreen.main.bounds.width/2-40, height: 200)
                                    .softOuterShadow()
                                VStack
                                {
                                    HStack
                                    { // 跳转到写留言
                                        NavigationLink(
                                            destination: NoteList(),
                                            label: {
                                                VStack(spacing: 10.0)
                                                {
                                                    Image(systemName: "plus.circle")
                                                        .resizable()
                                                        .frame(width: 60, height: 60)
                                                    Text("写留言")
                                                        .frame(width: 100, height: 40)
                                                        .background(Color.white.opacity(0.2))
                                                        .clipShape(Capsule())
                                                }.foregroundColor(.white)
                                            })
                                        
                                        // 最新的一条留言
                                        // 判断是否有留言有就显示
                                        if isstr > 0
                                        {
                                            VStack(spacing: 10.0)
                                            {
                                                Text("2月10日 10:20") // 备忘录时间
                                                Text("消息") // 备忘录信息  **注意换行
                                            }
                                            .frame(width: UIScreen.main.bounds.width/2-140, height: 200)
                                            .background(Color.yellow)
                                        }
                                    }
                                }
                            }.frame(width: UIScreen.main.bounds.width/2-40, height: 200)
                            // 冰箱控制功能
                            ZStack
                            {
                                RoundedRectangle(cornerRadius: 10)
                                    .fill(Color.Neumorphic.main)
                                    .frame(width: UIScreen.main.bounds.width/2-40, height: 200)
                                    .softOuterShadow()
                                VStack
                                {
                                    VStack(alignment: .leading)
                                    {
                                        HStack
                                        {
                                            Text("冰箱控制")
                                                .font(.system(size: 40))
                                            Spacer()
                                        }
                                        Text("您的冰箱现在很健康哦～") // 冰箱状态
                                    }
                                    .padding(.horizontal)
                                    .padding(.top, 10.0)
                                    // 预设的模式
                                    ScrollView(.horizontal, showsIndicators: false)
                                    {
                                        HStack(spacing: 30)
                                        {
                                            ForEach(gl, id: \.self)
                                            { value in
                                                // 跳转到调温界面
                                                CircleButton1(image: value, title: value, size: 40)
                                            }
                                            NavigationLink(
                                                destination: Thermostat(),
                                                isActive: $navtoThermostat,
                                                label: {
                                                    VStack(alignment: .center)
                                                    {
                                                        Button(action: {
                                                            self.navtoThermostat=true
                                                        }, label: {
                                                            VStack
                                                            {
                                                                Image("自定义")
                                                                    .resizable()
                                                                    .aspectRatio(contentMode: .fit)
                                                                    .font(.system(size: 48))
                                                                    .foregroundColor(Color.white.opacity(0.4))
                                                            }.frame(width: 40, height: 40, alignment: .center)
                                                        }).softButtonStyle(Circle())
                                                        Text("自定义").foregroundColor(.gray)
                                                    }
                                                })
                                        }
                                    }
                                    .padding()
                                }
                                .foregroundColor(.white)
                            }.frame(width: UIScreen.main.bounds.width/2-40, height: 200)
                        }
                        // 右侧
                        VStack(spacing: 10.0)
                        {
                            // 音乐区
                            ZStack
                            {
                                RoundedRectangle(cornerRadius: 10)
                                    .fill(Color.Neumorphic.main)
                                    .frame(width: UIScreen.main.bounds.width/2-40, height: 250)
                                    .softOuterShadow()
                                HStack(alignment: .top)
                                {
                                    Image("perch")
                                        .resizable()
                                        .frame(width: 100, height: 100)
                                        .cornerRadius(3.0) // 歌曲缩略图
                                    VStack(alignment: .leading, spacing: 6.0)
                                    {
                                        Text("周杰伦")
                                            .font(.subheadline) // 歌手
                                        Text("告白气球")
                                            .font(.headline) // 歌曲
                                        Slider(value: $stardmusic, in: 0 ... endmusic)
                                        HStack
                                        {
                                            Text("\(stardmusic, specifier: "%.2f")")
                                            Spacer()
                                            Text("\(endmusic, specifier: "%.2f")")
                                                .padding(.trailing)
                                        }
                                        HStack
                                        {
                                            Spacer()
                                            Button(action: /*@START_MENU_TOKEN@*/ {}/*@END_MENU_TOKEN@*/, label: {
                                                Image(systemName: "backward.end.fill")
                                                    .resizable()
                                                    .frame(width: 28, height: 28)
                                            }) // 上一曲
                                            Spacer()
                                            Button(action: {
                                                self.isplay.toggle()
                                            }, label: {
                                                Image(systemName: isplay ? "pause.fill" : "play.fill")
                                                    .resizable()
                                                    .frame(width: 28, height: 28)
                                            }) // 暂停播放
                                            Spacer()
                                            Button(action: {}, label: {
                                                Image(systemName: "forward.end.fill")
                                                    .resizable()
                                                    .frame(width: 28, height: 28)
                                            }) // 下一曲
                                                .padding(.trailing)
                                            Spacer()
                                        }
                                        .padding(.top, 20.0)
                                    }
                                }
                                .foregroundColor(.white)
                            }.frame(width: UIScreen.main.bounds.width/2-40, height: 250)
                            // 食物区
                            ZStack
                            {
                                RoundedRectangle(cornerRadius: 10)
                                    .fill(Color.Neumorphic.main)
                                    .frame(width: UIScreen.main.bounds.width/2-40, height: 450)
                                    .softOuterShadow()
                                VStack(alignment: .leading)
                                {
                                    HStack
                                    {
                                        NavigationLink(
                                            destination: OftenFood(),
                                            isActive: $navtoFood,
                                            label: {
                                                Button(action: { self.navtoFood.toggle() }, label: {
                                                    Text("食品管理")
                                                        .font(.system(size: 40))
                                                })
                                            })
                                        Spacer()
                                    }
                                    // 最近过期食物
                                    ForEach(foods, id: \.self)
                                    { value in
                                        NavigationLink(
                                            destination: Foodmessage(),
                                            isActive: $navtoFoodmessage,
                                            label: {
                                                Group
                                                {
                                                    HStack
                                                    {
                                                        Image(value) // 食物图片
                                                            .resizable()
                                                            .aspectRatio(1, contentMode: .fit)
                                                            .frame(width: 80, height: 80, alignment: .center)
                                                            .clipShape(Circle())
                                                        VStack(alignment: .leading, spacing: 6.0)
                                                        {
                                                            Text(value) // 食物名称
                                                                .font(.title)
                                                            HStack
                                                            {
                                                                Image(systemName: "exclamationmark.triangle")
                                                                Text("距离过期1天") // 食物状态
                                                                    .font(.system(size: 18))
                                                            }
                                                        }
                                                    }
                                                    .padding(.vertical)
                                                }
                                            })
                                    }
                                    Spacer()
                                }
                                .padding()
                                .frame(width: UIScreen.main.bounds.width/2-40, height: 450)
                                .foregroundColor(.white)
                            }.frame(width: UIScreen.main.bounds.width/2-40, height: 450)
                            // 功能区
                            ZStack
                            {
                                RoundedRectangle(cornerRadius: 10)
                                    .fill(Color.Neumorphic.main)
                                    .frame(width: UIScreen.main.bounds.width/2-40, height: 150)
                                    .softOuterShadow()
                                VStack
                                {
                                    Spacer()
                                    HStack(spacing: 20.0)
                                    { // 定时器
                                        Button(action: {}, label: {
                                            VStack
                                            {
                                                Image("定时器")
                                                    .resizable()
                                                    .aspectRatio(1, contentMode: .fit)
                                                    .frame(width: 60, height: 60)
                                                    .clipShape(RoundedRectangle(cornerRadius: 10.0))
                                                Text("定时器")
                                            }
                                        })
                                        // 门铃
                                        NavigationLink(
                                            destination: Doorbell(),
                                            isActive: $navtoDoorbell,
                                            label: {
                                                Button(action: {
                                                    self.navtoDoorbell=true
                                                }, label: {
                                                    VStack
                                                    {
                                                        Image("门铃")
                                                            .resizable()
                                                            .aspectRatio(1, contentMode: .fit)
                                                            .frame(width: 60, height: 60)
                                                            .clipShape(RoundedRectangle(cornerRadius: 10.0))
                                                        Text("门铃")
                                                    }
                                                })
                                            })
                                        
                                        // 电话
                                        Button(action: {}, label: {
                                            VStack
                                            {
                                                Image("电话")
                                                    .resizable()
                                                    .aspectRatio(1, contentMode: .fit)
                                                    .frame(width: 60, height: 60)
                                                    .clipShape(RoundedRectangle(cornerRadius: 10.0))
                                                Text("电话")
                                            }
                                        })
                                    }
                                    
                                    Spacer()
                                }
                                .padding()
                                .frame(width: UIScreen.main.bounds.width/2-40, height: 150)
                                .foregroundColor(.white)
                            }.frame(width: UIScreen.main.bounds.width/2-40, height: 150)
                        }
                    }
                    Spacer()
                }
                .padding(.vertical, 60.0)
                .navigationBarHidden(true)
            }
        }
        .navigationViewStyle(StackNavigationViewStyle())
        .navigationBarBackButtonHidden(true)
        .navigationBarHidden(true)
    }
}

struct HomepageView_Previews: PreviewProvider
{
    static var previews: some View
    {
        HomepageView()
    }
}
