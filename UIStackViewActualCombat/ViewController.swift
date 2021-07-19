//
//  ViewController.swift
//  UIStackViewActualCombat
//
//  Created by 陈学明 on 2021/7/6.
//

import UIKit

class ViewController: UIViewController {
    var tableView:UITableView!
    var dataSource:[VCModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        title = "首页"
        loadDataSource()
        configuration()
    }
    
    func configuration() {
        tableView = UITableView(frame: view.bounds, style: .plain)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = 44
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "UITableViewCell")
        view.addSubview(tableView)
    }
    
    func loadDataSource() {
        dataSource.append(VCModel(className: AlignmentViewController.self, title: "对齐方式"))
        dataSource.append(VCModel(className: DocmentStreamViewController.self, title: "线性瀑布流布局"))
        dataSource.append(VCModel(className: MultipleRowViewController.self, title: "多行内容高度可变视图"))
        dataSource.append(VCModel(className: ListViewController.self, title: "多样式列表"))
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "UITableViewCell")!
        cell.textLabel?.text = dataSource[indexPath.row].title
        return cell
    }
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = dataSource[indexPath.row].getVc()
        navigationController?.pushViewController(vc, animated: true)
    }
}
