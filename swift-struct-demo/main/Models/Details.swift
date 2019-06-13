//
//  Details.swift
//  swift-struct-demo
//
//  Created by apple on 2019/6/12.
//  Copyright © 2019 wyy. All rights reserved.
//

import Foundation
import UIKit
import VueSwift
struct Details:MainProtocol{

    static func getViewController() -> UIViewController{
        
        let vc = MainVC()
        vc.m = Details()
        return vc
    }
    
    var arrayVue:Vue = Vue()
    var indexVue:Vue = Vue()
    func startListen(){
        
        loadData()
        indexVue.v_index {(index) in
            
            print(index)
            
            var d = self.arrayVue.v_array?[index] as! MainModel
            d.name = "yes"
            self.arrayVue.v_array?[index] = d
            self.arrayVue.v_reload()
        }
        
        
    }
    func loadData(){
        
        
        var array = Array<VueData>()
        for i in 1...120{
            
            var m = MainModel()
            m.name = "details\(i)"
            array.append(m)
            
        }
        
        arrayVue.v_array(true, v: { () -> Array<VueData>? in
            
            return array
        })
    }
    
}
