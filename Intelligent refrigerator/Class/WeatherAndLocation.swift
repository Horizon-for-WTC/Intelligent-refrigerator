//
//  WeatherAndLocation.swift
//  Intelligent refrigerator
//
//  Created by RemiliaScarlet on 2021/3/8.
//测试一下。。。。lkj

import Foundation
import CoreLocation
import Alamofire
import SwiftyJSON

class LocationViewModel: NSObject, ObservableObject{
    
    @Published var userLatitude: Double = 39.9165
    @Published var userLongitude: Double = 116.3971
    @Published var myLocalArea = "北京"//位置坐标默认天安门
    
    private let locationManager = CLLocationManager()
    
    override init() {
        super.init()
        self.locationManager.delegate = self
        self.locationManager.desiredAccuracy = kCLLocationAccuracyBest
        self.locationManager.requestWhenInUseAuthorization()
        self.locationManager.startUpdatingLocation()
    }
}

extension LocationViewModel: CLLocationManagerDelegate {
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        //print("开始获取坐标信息")
        guard let location = locations.last else { return }
        
        userLatitude = location.coordinate.latitude
        userLongitude = location.coordinate.longitude
        
        GetAreaLocation()//获取地理信息
        
    }
    
    func GetAreaLocation(){
        
        let geoCoder = CLGeocoder()
        let location = CLLocation(latitude: userLatitude, longitude: userLongitude)
        geoCoder.reverseGeocodeLocation(location, completionHandler:
                                            {
                                                placemarks, error -> Void in
                                                
                                                // Place details
                                                guard let placeMark = placemarks?.first else { return }
                                                
                                                if let city = placeMark.locality {
                                                    //print("城",city)
                                                    self.myLocalArea = city
                                                }
                                                // City area
                                                if let area = placeMark.subLocality {
                                                    //print("区",area)
                                                    self.myLocalArea += area
                                                }
                                                //print(self.myLocalArea)
                                            })
    }
    
}

class CaiYunJsonRealtime:LocationViewModel {
    
    @Published var nowTem = 0//当前温度
    @Published var airQuality = ""//空气质量
    @Published var windDirection = ""//风向
    @Published var humidity = 0//湿度
    @Published var skycon = ""
    
    let cyToken = "HYzglwyB98oRNaYL"
    var cyUrl: URL { URL(string: "https://api.caiyunapp.com/v2.5/\(cyToken)/\(userLongitude),\(userLatitude)/realtime.json")! }
    //我的彩云开发者api。。。禁止外传，，，，，
    
    func cyNetworkStart() {
        
        //let queue = DispatchQueue.main
        // queue.async {
        print(self.cyUrl)
        AF.request(self.cyUrl).responseJSON{
            (response) in
            switch response.result{
            case .success:
                if let value = response.value{
                    let json = JSON(value)
                    //print(json)
                    if let number = json["result"]["realtime"]["temperature"].int{
                        self.nowTem = number
                        print("当前温度",self.nowTem)
                    }
                    if let number = json["result"]["realtime"]["air_quality"]["description"]["chn"].string{
                        self.airQuality = number
                        print("当前空气质量",self.airQuality)
                    }
                    if let number = json["result"]["realtime"]["wind"]["direction"].double{
                        switch number {
                        case 0..<10:
                            self.windDirection = "北风"
                        case 11..<80:
                            self.windDirection = "东北风"
                        case 81..<110:
                            self.windDirection = "东风"
                        case 111..<170:
                            self.windDirection = "东南风"
                        case 171..<190:
                            self.windDirection = "南风"
                        case 191..<260:
                            self.windDirection = "西南风"
                        case 261..<280:
                            self.windDirection = "西风"
                        case 281..<350:
                            self.windDirection = "西北风"
                        default:
                            self.windDirection = "北风"
                        }
                        print("当前风向",self.windDirection)
                    }
                    if let number = json["result"]["realtime"]["humidity"].double{
                        self.humidity = Int(number * 100)
                        print("当前湿度",self.humidity)
                    }
                    if let number = json["result"]["realtime"]["skycon"].string{
                        self.skycon = number
                        print("当前天气情况",self.skycon)
                    }
                    
                }
                break
            case .failure(let error):
                print("error:\(error)")
                break
            }
        }
    }
    // }
}

class CaiYunJsonXXIV: LocationViewModel {
    @Published var highTem: [Double] = []
    @Published var highTem2: [Double] = []
    
    let cyToken = "HYzglwyB98oRNaYL"
    var cyUrl: URL { URL(string: "https://api.caiyunapp.com/v2.5/\(cyToken)/\(userLongitude),\(userLatitude)/hourly.json")! }
    
    
    
    
    func cyNetworkStartXXIV()  {
        
        //        let queue = DispatchQueue.main
        //        queue.async {
        //开新线程
        print(self.cyUrl)
        AF.request(self.cyUrl).responseJSON{ [self]
            (response) in
            switch response.result{
            case .success:
                if let value = response.value{
                    let json = JSON(value)
                    //获得json数据，开始swiftyjson解析
                    for index in 0...23 {
                        if let number = json["result"]["hourly"]["temperature"][index]["value"].double{
                            //print(number)
                            self.highTem.append(number)
                            //print(self.highTem)
                        }
                    }//遍历写入前24小时温度
                    for index in 24...json["result"]["hourly"]["temperature"].count {
                        if let number = json["result"]["hourly"]["temperature"][index]["value"].double{
                            //print(number)
                            self.highTem2.append(number)
                            //print(self.highTem)
                        }
                    }//遍历写入后24小时温度
                    
                    
                }
                break
                
            case .failure(let error):
                print("error\(error)")
                break
            }
        }
    }
    //  }
}
