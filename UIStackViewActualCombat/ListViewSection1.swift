//
//  ListViewSection1.swift
//  UIStackViewActualCombat
//
//  Created by 陈学明 on 2021/7/19.
//

import UIKit

class ListViewSection1: UIView {

    let contentView = UIView()
    let contentStackView = UIStackView()
    let section1StackView = UIStackView()
    let section2StackView = UIStackView()
    let section3StackView = UIStackView()
    let buttonsStack = UIStackView()
    
    init() {
        super.init(frame: .zero)
        layer.cornerRadius = 10
        backgroundColor = .white
        configurationContent();
        configurationSection1()
        configurationSection2()
        configurationSection3()
        contentStackView.addArrangedSubview(section1StackView)
        contentStackView.addArrangedSubview(section2StackView)
        contentStackView.addArrangedSubview(section3StackView)
        
        buttonsStack.axis = .horizontal
        buttonsStack.alignment = .center
        buttonsStack.distribution = .equalSpacing
        buttonsStack.spacing = 5
        addSubview(buttonsStack)
        buttonsStack.snp.makeConstraints { make in
            make.top.equalTo(contentView.snp.bottom).offset(10)
            make.left.equalTo(10)
            make.height.equalTo(40)
            make.bottom.equalTo(self.snp.bottom).offset(-20)
        }
        setupButtons()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configurationContent() {
        addSubview(contentView)
        contentView.snp.makeConstraints { make in
            make.top.equalTo(10)
            make.left.equalTo(10)
            make.right.equalTo(-10)
            make.width.equalTo(SCR_W - 60.0)
        }
        contentStackView.axis = .vertical
        contentStackView.alignment = .leading
        contentStackView.distribution = .equalSpacing
        contentStackView.spacing = 10
        contentView.addSubview(contentStackView)
        
        contentStackView.snp.makeConstraints { make in
            make.left.top.equalTo(10)
            make.right.equalTo(-10)
            make.bottom.equalTo(contentView.snp.bottom).offset(-10)
        }
    }
    
    func configurationSection1() {
        section1StackView.axis = .vertical
        section1StackView.alignment = .leading
        section1StackView.distribution = .equalSpacing
        section1StackView.spacing = 10
        section1StackView.tag = 1
        section1StackView.clipsToBounds = true
        for _ in 0..<4 {
            let item = UILabel()
            item.text = "第一组"
            item.backgroundColor = UIColor(displayP3Red: 0.95, green: 0.95, blue: 0.95, alpha: 1.0)
            section1StackView.addArrangedSubview(item)
            let w = SCR_W - 80.0 - CGFloat(arc4random() % 200);
            item.snp.makeConstraints { make in
                make.height.equalTo(25)
                make.width.equalTo(w)
            }
        }
    }
    
    func configurationSection2() {
        section2StackView.axis = .horizontal
        section2StackView.alignment = .fill
        section2StackView.distribution = .fillEqually
        section2StackView.spacing = 10
        section2StackView.tag = 2
        section2StackView.clipsToBounds = true
        section2StackView.snp.makeConstraints { make in
            make.width.equalTo(SCR_W - 80.0)
            make.height.equalTo(100)
        }
        for _ in 0..<4 {
            let item = UILabel()
            item.text = "第二组"
            item.backgroundColor = UIColor(displayP3Red: 0.95, green: 0.95, blue: 0.95, alpha: 1.0)
            section2StackView.addArrangedSubview(item)
        }
    }
    
    func configurationSection3() {
        section3StackView.axis = .vertical
        section3StackView.alignment = .fill
        section3StackView.distribution = .equalSpacing
        section3StackView.spacing = 10
        section3StackView.tag = 3
        section3StackView.clipsToBounds = true
        section3StackView.snp.makeConstraints { make in
            make.width.equalTo(SCR_W - 80.0)
        }
        for _ in 0..<4 {
            let item = UILabel()
            item.text = "第三组"
            item.backgroundColor = UIColor(displayP3Red: 0.95, green: 0.95, blue: 0.95, alpha: 1.0)
            section3StackView.addArrangedSubview(item)
            item.snp.makeConstraints { make in
                make.height.equalTo(25)
            }
        }
    }
    
    func setupButtons() {
        let normalTitles = ["隐藏第一组", "隐藏第二组", "隐藏第三组"]
        let hiddenTitles = ["显示第一组", "显示第二组", "显示第三组"]
        for i in 0..<3 {
            let btn = UIButton()
            btn.titleLabel?.font = UIFont.systemFont(ofSize: 12)
            btn.contentEdgeInsets = UIEdgeInsets(top: 2, left: 2, bottom: 2, right: 2)
            btn.setTitle(normalTitles[i], for: .normal)
            btn.setTitle(hiddenTitles[i], for: .selected)
            btn.setTitleColor(.black, for: .normal);
            btn.backgroundColor = UIColor(displayP3Red: 0.95, green: 0.95, blue: 0.95, alpha: 1.0)
            btn.tag = i + 1
            btn.addTarget(self, action: #selector(clickde(btn:)), for: .touchUpInside)
            buttonsStack.addArrangedSubview(btn);
        }
    }
}

extension ListViewSection1 {
    @objc func clickde(btn: UIButton) {
        btn.isSelected = !btn.isSelected
        guard let stackView = contentStackView.viewWithTag(btn.tag) else {
            return
        }
        UIView.animate(withDuration: 0.25) {
            stackView.isHidden = btn.isSelected
        }
    }
}
