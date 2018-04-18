//
//  HWQSecondMenuController.swift
//  HWQLztUI
//
//  Created by hwq on 2018/4/17.
//  Copyright © 2018年 hwq. All rights reserved.
//

import UIKit

let HScreenWidht = UIScreen.main.bounds.size.width
let HScreenHeight = UIScreen.main.bounds.size.height

class HWQSecondMenuController: UITableViewController {
    
    var sectionTitles = ["A","B","C","D","E","F"]
    var sectionContent = ["ADFAD","asfasdfasdfasdfasdf","就阿克苏交电费卡家控件饭卡上交电费卡家啊快结束的咖啡机卡上交电费卡就阿克苏风景卡时间看风景看房就","jkajkjsdkf","asdfasdf","sfiwefi"]
    
    var state = Array(repeating: false, count: 20) //section展开与否状态, true:已展开， false：未展开


    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "常见问题"
        
        setTableView()
        
    }

    func setTableView() {
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 200
        tableView.tableFooterView = UIView()
        tableView.backgroundColor = UIColor.lightGray
        
        tableView.register(SecondMenuCell.self, forCellReuseIdentifier: "cell")
    }
    
    
        

    @objc func sectionAction(control : UIControl) {
        let section = control.tag
        if state[section] {
            state[section] = false
        }else {
            state[section] = true
        }
        
        
        //刷新指定section
        self.tableView.reloadSections(IndexSet(integer: section), with: .fade)
        
    }
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        
        return sectionTitles.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if self.state[section] {
            return 1
        }else {
            return 0
        }
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! SecondMenuCell
        cell.selectionStyle = .none
        cell.content.text = self.sectionContent[indexPath.section]
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let bgView = UIView(frame: CGRect(x: 0, y: 0, width: HScreenWidht, height: 44))
        //bgView.backgroundColor = UIColor.white
        
        let control = UIControl(frame: CGRect(x: 0, y: 0, width: HScreenWidht, height: 44))
        control.backgroundColor = UIColor.white
        control.addTarget(self, action: #selector(self.sectionAction(control:)), for: UIControlEvents.touchUpInside)
        control.tag = section

        let title = UILabel(frame: CGRect(x: 20, y: 2, width: HScreenWidht * 2 / 3, height: 40))
        title.textColor = UIColor.darkGray
        title.text = self.sectionTitles[section]
        control.addSubview(title)

        let imageView = UIImageView(frame: CGRect(x: HScreenWidht - 40, y: 17, width:  10, height: 10))
        if self.state[section] {
             imageView.image = UIImage(named: "向上")
        }else {
             imageView.image = UIImage(named: "向右")
        }

        control.addSubview(imageView)

        bgView.addSubview(control)

        return bgView
    }
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        
        return 45.0
    }
}
