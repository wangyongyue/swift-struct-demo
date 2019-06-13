//
//  MainCell.swift
//  test
//
//  Created by apple on 2019/6/12.
//  Copyright © 2019 wyy. All rights reserved.
//

import UIKit
import VueSwift
class MainCell: UITableViewCell, CellProtocol{

   
    let textVue = Vue()
    let tapVue = Vue()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        let label = UILabel()
        label.textColor = UIColor.black
        label.textAlignment = .left
        let tap = UITapGestureRecognizer()
        self.contentView.addSubview(label)
        self.contentView.addGestureRecognizer(tap)
        
        label.snp.makeConstraints { (make) in
            make.top.equalTo(0)
            make.left.equalTo(0)
            make.right.equalTo(0)
            make.bottom.equalTo(0)
            
        }
        
        label.v_text(vue:textVue)
        tap.v_on(vue: tapVue)
        
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
    }
    func setModel(_ amodel: VueData) {
        
        if amodel is MainModel{
            
            var h = amodel as! MainModel
            textVue.v_text { () -> String? in
                return h.name
            }
            tapVue.v_on {
                h.v_identifier = 0
                h.v_selectVue.v_on?()
            }
            
        }
    }
    
    
}

struct MainModel:VueData {
    var v_palm: String = "MainCell"
    var v_identifier: Int = 0
    var v_selectVue: Vue = Vue()
    
    var name:String?
}
