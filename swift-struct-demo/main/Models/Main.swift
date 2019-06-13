//
//  Main.swift
//  test
//
//  Created by apple on 2019/6/12.
//  Copyright © 2019 wyy. All rights reserved.
//

import Foundation
import UIKit
import VueSwift
struct Main:MainProtocol{
    static func getViewController() -> UIViewController{
        
        let vc = MainVC()
        vc.m = Main()
        return vc
    }
    
    var arrayVue:Vue = Vue()
    var indexVue:Vue = Vue()
    func startListen(){
        
        loadData()
        indexVue.v_index { (index) in
            
            print(index)
            Router.push(Details.getViewController(), nil, nil)
        }
        
        
    }
    func loadData(){
        
        
        var array = Array<VueData>()
        for i in 1...12{
            
            var m = MainModel()
            m.name = "struct\(i)"
            array.append(m)
            
        }
        
        arrayVue.v_array(true, v: { () -> Array<VueData>? in
            
            return array
        })
    }
    
}
