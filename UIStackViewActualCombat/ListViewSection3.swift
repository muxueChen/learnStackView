//
//  ListViewSection3.swift
//  UIStackViewActualCombat
//
//  Created by 陈学明 on 2021/7/19.
//

import UIKit

class ListViewSection3: UIView {

    init() {
        super.init(frame: .zero)
        layer.cornerRadius = 10
        backgroundColor = .white
        let header = UIView()
        header.backgroundColor = UIColor(displayP3Red: 0.95, green: 0.95, blue: 0.95, alpha: 1.0)
        addSubview(header)
        header.snp.makeConstraints { make in
            make.height.equalTo(20)
            make.width.equalTo(200)
            make.top.left.equalTo(15)
        }
        let contentView = UIView()
        addSubview(contentView);
        contentView.snp.makeConstraints { make in
            make.top.equalTo(10)
            make.left.equalTo(15)
            make.right.equalTo(-15)
            make.width.equalTo(SCR_W - 60.0)
            make.bottom.equalTo(-20)
        }
        
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.spacing = 15
        stackView.alignment = .fill
        contentView.addSubview(stackView)
        stackView.snp.makeConstraints { make in
            make.left.right.equalTo(0)
            make.top.equalTo(header.snp.bottom).offset(10)
            make.bottom.equalTo(-15)
        }
        for _ in 0..<2 {
            let itemView = UIButton()
            
            itemView.backgroundColor = UIColor(displayP3Red: 0.95, green: 0.95, blue: 0.95, alpha: 1.0)
            itemView.snp.makeConstraints { make in
                make.height.equalTo(100)
            }
            stackView.addArrangedSubview(itemView)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
