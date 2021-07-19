//
//  ListViewSection2.swift
//  UIStackViewActualCombat
//
//  Created by 陈学明 on 2021/7/19.
//

import UIKit

class ListViewSection2: UIView {

    init() {
        super.init(frame: .zero)
        layer.cornerRadius = 10
        backgroundColor = .white
        snp.makeConstraints { make in
            make.width.equalTo(SCR_W - 40)
            make.height.equalTo(150)
        }
        
        let header = UIView()
        header.backgroundColor = UIColor(displayP3Red: 0.95, green: 0.95, blue: 0.95, alpha: 1.0)
        addSubview(header)
        header.snp.makeConstraints { make in
            make.height.equalTo(20)
            make.width.equalTo(200)
            make.top.left.equalTo(15)
        }
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.spacing = 15
        stackView.alignment = .fill
        addSubview(stackView)
        stackView.snp.makeConstraints { make in
            make.left.equalTo(15)
            make.top.equalTo(header.snp.bottom).offset(10)
            make.right.equalTo(-15)
            make.bottom.equalTo(-15)
        }
        for _ in 0..<4 {
            let itemView = UIButton()
            itemView.backgroundColor = UIColor(displayP3Red: 0.95, green: 0.95, blue: 0.95, alpha: 1.0)
            stackView.addArrangedSubview(itemView)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
