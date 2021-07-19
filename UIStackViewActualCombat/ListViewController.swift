//
//  ListViewController.swift
//  UIStackViewActualCombat
//
//  Created by 陈学明 on 2021/7/18.
//

import UIKit


/// 多样式列表应用
class ListViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "多样式列表"
        view.backgroundColor = .white
        let scrollView = UIScrollView()
        scrollView.contentInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        scrollView.backgroundColor = UIColor(displayP3Red: 0.9, green: 0.9, blue: 0.9, alpha: 1.0)
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .equalSpacing
        stackView.spacing = 20
        stackView.alignment = .center
        view.addSubview(scrollView)
        scrollView.addSubview(stackView)

        scrollView.snp.makeConstraints { (make) in
            make.edges.equalTo(self.view)
        }
        
        stackView.snp.makeConstraints { (make) in
            make.left.right.equalTo(self.view)
            make.top.bottom.equalTo(scrollView)
        }
        let itemView1 = ListViewSection1()
        stackView.addArrangedSubview(itemView1)
        
        let itemView2 = ListViewSection2()
        stackView.addArrangedSubview(itemView2)
        
        let itemView3 = ListViewSection3()
        stackView.addArrangedSubview(itemView3)
        
        let itemView4 = ListViewSection1()
        stackView.addArrangedSubview(itemView4)
        
        let itemView5 = ListViewSection2()
        stackView.addArrangedSubview(itemView5)
        
        let itemView6 = ListViewSection3()
        stackView.addArrangedSubview(itemView6)
    }
    
    @objc func handle(btn: UIButton) {
        UIView.animate(withDuration: 0.25) {
            btn.isHidden = true
        }
    }
}
