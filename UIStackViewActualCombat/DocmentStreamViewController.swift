//
//  DoumentStreamViewController.swift
//  UIStackViewActualCombat
//
//  Created by 陈学明 on 2021/7/18.
//

import UIKit

/** 线性文档流布局 */
class DocmentStreamViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        title = "线性文档流"
        let scrollView = UIScrollView()
        scrollView.backgroundColor = UIColor.red
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .equalSpacing
        stackView.spacing = 20
        stackView.alignment = .center
        view.addSubview(scrollView)
        scrollView.addSubview(stackView)
        
        for i in 0..<10 {
            let itemView = UIButton()
            itemView.setTitle("View\(i)", for: .normal)
            itemView.addTarget(self, action: #selector(handle), for: .touchUpInside)
            itemView.backgroundColor = .green
            itemView.snp.makeConstraints { (make) in
                make.height.equalTo(200)
                make.width.equalTo(self.view.frame.width - 40)
            }
            stackView.addArrangedSubview(itemView)
        }
        
        scrollView.snp.makeConstraints { (make) in
            make.edges.equalTo(self.view)
        }
        
        stackView.snp.makeConstraints { (make) in
            make.left.right.equalTo(self.view)
            make.top.bottom.equalTo(scrollView)
        }
    }
    
    @objc func handle(btn: UIButton) {
        UIView.animate(withDuration: 0.25) {
            btn.isHidden = true
        }
    }
}
