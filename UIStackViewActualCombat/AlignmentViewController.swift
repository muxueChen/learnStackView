//
//  AlignmentViewController.swift
//  UIStackViewActualCombat
//
//  Created by 陈学明 on 2021/7/6.
//

import UIKit

/// 不同对齐方式的应用
class AlignmentViewController: UIViewController {
    let contentView = UIView()
    let stackView = UIStackView()
    let buttonsStack = UIStackView()
    
    let imageView = UIImageView(image: UIImage(named: "icon"))
    let label = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "视图对齐的应用"
        view.backgroundColor = .white
        setupSubviews()
        centerAlinmentLayout()
    }
}

extension AlignmentViewController {
    func setupSubviews() {
        stackView.axis = .horizontal
        stackView.alignment = .center
        stackView.distribution = .equalSpacing
        stackView.spacing = 10
        
        contentView.backgroundColor = UIColor.red
        view.addSubview(contentView)
        contentView.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.width.height.equalTo(SCR_W - 40)
        }
        contentView.addSubview(stackView)
        
        label.text = "安静的label"
        label.backgroundColor = .green
        imageView.backgroundColor = .green

        imageView.snp.makeConstraints { make in
            make.width.height.equalTo(20)
        }
        stackView.addArrangedSubview(imageView)
        stackView.addArrangedSubview(label)
        
        buttonsStack.axis = .horizontal
        buttonsStack.alignment = .center
        buttonsStack.distribution = .equalSpacing
        buttonsStack.spacing = 5
        view.addSubview(buttonsStack)
        buttonsStack.snp.makeConstraints { make in
            make.top.equalTo(contentView.snp.bottom).offset(10)
            make.left.equalTo(10)
            make.height.equalTo(40)
        }
        
        let titles = ["左对齐", "右对齐", "顶部对齐", "底部对齐", "剧中对齐", "增加文字"]
        let selectors = [#selector(leftAlinmentLayout), #selector(rightAlinmentLayout),  #selector(topAlinmentLayout), #selector(bottomAlinmentLayout), #selector(centerAlinmentLayout), #selector(addText)]
        
        for (index, item) in titles.enumerated() {
            let btn = UIButton()
            btn.titleLabel?.font = UIFont.systemFont(ofSize: 12)
            btn.contentEdgeInsets = UIEdgeInsets(top: 2, left: 2, bottom: 2, right: 2)
            btn.setTitle(item, for: .normal)
            btn.setTitleColor(.green, for: .normal);
            btn.backgroundColor = .lightGray
            btn.tag = index
            btn.addTarget(self, action: selectors[index], for: .touchUpInside)
            buttonsStack.addArrangedSubview(btn);
        }
    }
}

extension AlignmentViewController {
    @objc func leftAlinmentLayout() {
        stackView.axis = .horizontal
        
        stackView.snp.remakeConstraints { make in
            make.left.equalTo(10)
            make.centerY.equalToSuperview();
        }
    }
    
    @objc func rightAlinmentLayout() {
        stackView.axis = .horizontal
        stackView.snp.remakeConstraints { make in
            make.right.equalTo(-10)
            make.centerY.equalToSuperview();
        }
    }
    
    @objc func topAlinmentLayout() {
        stackView.axis = .vertical
        stackView.snp.remakeConstraints { make in
            make.top.equalTo(10)
            make.centerX.equalToSuperview();
        }
    }
    
    @objc func bottomAlinmentLayout() {
        stackView.axis = .vertical
        stackView.snp.remakeConstraints { make in
            make.bottom.equalTo(-10)
            make.centerX.equalToSuperview();
        }
    }
    
    @objc func centerAlinmentLayout() {
        stackView.axis = .horizontal
        stackView.snp.remakeConstraints { make in
            make.center.equalToSuperview();
        }
    }
    @objc func addText() {
        guard var text = label.text else { return };
        text += "，我是label"
        label.text = text
    }
}
