//
//  OrderContentView.swift
//  House
//
//  Created by User on 5/23/22.
//

import UIKit

protocol OrderContentViewDelegate: AnyObject {
    func handleDismiss(in view: OrderContentView)
    func handleFullApp(in view: OrderContentView)
}

public final class OrderContentView: UIView {
    
    weak var delegate: OrderContentViewDelegate?
    
    private var topBarView: UIView = {
        let view = UIView()
        view.backgroundColor = Colors.gray.withAlphaComponent(0.1)
        return view
    }()
    
    private var titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.textAlignment = .center
        label.adjustsFontSizeToFitWidth = true
        return label
     }()
    
    private var doneButton: UIButton = {
        let button = UIButton()
        button.configuration = .plain()
        let attrString = NSMutableAttributedString(string: "Done", attributes: [
            NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 16)
               ])
        button.setAttributedTitle(attrString, for: .normal)
        button.contentHorizontalAlignment = .center
        return button
    }()
    
    private var contentStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .fill
        stackView.spacing = 10
        return stackView
    }()
    
    private var orderedTitle: UILabel = {
        let label = UILabel()
        label.text = "You ordered"
        label.textColor = .black
        label.textAlignment = .center
        return label
    }()
    
    private var menuImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.layer.masksToBounds = true
        imageView.layer.cornerRadius = 12
        return imageView
    }()
    
    private var priceAndsmallLabelStackView: UIStackView = {
        let stakcView = UIStackView()
        stakcView.axis = .horizontal
        stakcView.distribution = .fill
        stakcView.spacing = 10
        return stakcView
    }()
    
    private var smallTitleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.textAlignment = .right
        return label
    }()
    
    private var priceLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.textAlignment = .right
        return label
    }()
    
    private var ordersNumberLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 20)
        label.textAlignment = .center
        return label
    }()
    
    private var thanksLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 20)
        label.textAlignment = .center
        return label
    }()
    
    private var fullAppButton: UIButton = {
        let button = UIButton()
        button.configuration = .filled()
        button.configuration?.cornerStyle = .capsule
        button.configuration?.baseBackgroundColor = .cyan.withAlphaComponent(0.7)
        let attrString = NSMutableAttributedString(string: "Full App", attributes: [
            NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 16),
            NSAttributedString.Key.foregroundColor : Colors.black
               ])
        button.setAttributedTitle(attrString, for: .normal)
        button.contentHorizontalAlignment = .center
        return button
    }()
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        addSubviews()
        setupActions()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public override func layoutSubviews() {
        setupConstraints()
    }
    
    public func update(viewModel: Furniture) {
        titleLabel.text = viewModel.title
        menuImageView.image = UIImage(imageLiteralResourceName: viewModel.imageName)
        smallTitleLabel.text = viewModel.title
        priceLabel.text = viewModel.price + "$"
        thanksLabel.text = "Thanks for order!"
        ordersNumberLabel.text = MockFurniture.shared.numbersOfOrder(viewModel: viewModel)
    }
}

// MARK: - Actions

extension OrderContentView {
    private func setupActions() {
        doneButton.addTarget(self, action: #selector(dismiss), for: .touchUpInside)
        fullAppButton.addTarget(self, action: #selector(handleFullApp), for: .touchUpInside)
    }
    
    @objc
    private func dismiss() {
        delegate?.handleDismiss(in: self)
    }
    
    @objc func handleFullApp() {
        delegate?.handleFullApp(in: self)
    }
}

// MARK: - Constraints & Subview

extension OrderContentView {
    private func addSubviews() {
        [topBarView, contentStackView].forEach { addSubview($0) }
        [titleLabel, doneButton].forEach { addSubview($0) }
        [orderedTitle, menuImageView, priceAndsmallLabelStackView, ordersNumberLabel, thanksLabel, fullAppButton]
            .forEach { contentStackView.addSubview($0) }
        [smallTitleLabel, priceLabel].forEach { priceAndsmallLabelStackView.addSubview($0) }
    }
    
    private func setupConstraints() {
        topBarView.snp.makeConstraints {
            $0.leading.equalToSuperview()
            $0.trailing.equalToSuperview()
            $0.top.equalToSuperview()
            $0.height.equalTo(50)
        }
        
        titleLabel.snp.makeConstraints {
            $0.leading.equalToSuperview()
            $0.trailing.equalToSuperview()
            $0.top.equalToSuperview().offset(12)
        }
        
        doneButton.snp.makeConstraints {
            $0.trailing.equalToSuperview()
            $0.top.top.equalToSuperview().offset(12)
            $0.height.equalTo(24)
            $0.width.equalTo(70)
        }
        
        contentStackView.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(10)
            $0.trailing.equalToSuperview().inset(10)
            $0.top.equalTo(topBarView.snp.bottom)
            $0.bottom.equalToSuperview()
        }
        
        orderedTitle.snp.makeConstraints {
            $0.leading.equalToSuperview()
            $0.trailing.equalToSuperview()
            $0.top.equalTo(contentStackView.snp.top).offset(10)
            $0.height.equalTo(40)
        }
        
        menuImageView.snp.makeConstraints {
            $0.leading.equalToSuperview()
            $0.trailing.equalToSuperview()
            $0.top.equalTo(orderedTitle.snp.bottom)
            $0.height.equalTo(bounds.height * 0.4)
        }
        
        priceAndsmallLabelStackView.snp.makeConstraints {
            $0.leading.equalToSuperview()
            $0.trailing.equalToSuperview()
            $0.top.equalTo(menuImageView.snp.bottom)
            $0.height.equalTo(24)
        }
        
        smallTitleLabel.snp.makeConstraints {
            $0.leading.equalToSuperview()
            $0.top.equalToSuperview()
            $0.bottom.equalToSuperview()
        }
        
        priceLabel.snp.makeConstraints {
            $0.trailing.equalToSuperview()
            $0.top.equalToSuperview()
            $0.bottom.equalToSuperview()
        }
        
        ordersNumberLabel.snp.makeConstraints {
            $0.leading.equalToSuperview()
            $0.trailing.equalToSuperview()
            $0.top.equalTo(priceAndsmallLabelStackView.snp.bottom).offset(40)
            $0.height.equalTo(34)
        }
        
        thanksLabel.snp.makeConstraints {
            $0.leading.equalToSuperview()
            $0.trailing.equalToSuperview()
            $0.top.equalTo(ordersNumberLabel.snp.bottom).offset(10)
            $0.height.equalTo(34)
        }
        
        fullAppButton.snp.makeConstraints {
            $0.leading.equalToSuperview()
            $0.trailing.equalToSuperview()
            $0.top.equalTo(thanksLabel.snp.bottom).offset(40)
            $0.height.equalTo(40)
        }
    }
}
