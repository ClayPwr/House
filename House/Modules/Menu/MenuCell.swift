//
//  MenuCell.swift
//  House
//
//  Created by User on 5/8/22.
//

import UIKit
import SnapKit

public final class MenuCell: UITableViewCell {
    
    // TODO: add variable with didSet inside it update ui
    
    private var mainStackView: UIStackView = {
        let stakcView = UIStackView()
        stakcView.axis = .horizontal
        stakcView.distribution = .fill
        stakcView.spacing = 10
        return stakcView
    }()
    
    private var menuImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.layer.masksToBounds = true
        imageView.layer.cornerRadius = 12
        return imageView
    }()
    
    private var contentStackView: UIStackView = {
        let stakcView = UIStackView()
        stakcView.axis = .vertical
        stakcView.distribution = .fill
        stakcView.spacing = 10
        return stakcView
    }()
    
    private var titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.textAlignment = .left
        label.adjustsFontSizeToFitWidth = true
        return label
     }()
    
    private var descriptionLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.textAlignment = .left
        label.numberOfLines = 2
        return label
    }()
    
    private var priceAndActionStackView: UIStackView = {
        let stakcView = UIStackView()
        stakcView.axis = .horizontal
        stakcView.distribution = .fill
        stakcView.spacing = 10
        return stakcView
    }()
    
    private var priceLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.textAlignment = .left
        return label
    }()
    
    private var orderButton: UIButton = {
        let button = UIButton()
        button.configuration = .filled()
        button.configuration?.cornerStyle = .capsule
        button.configuration?.baseBackgroundColor = .orange.withAlphaComponent(0.7)
        let attrString = NSMutableAttributedString(string: "Order", attributes: [
            NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 16),
            NSAttributedString.Key.foregroundColor : Colors.black
               ])
        button.setAttributedTitle(attrString, for: .normal)
        button.contentHorizontalAlignment = .center
        return button
    }()
    
    public override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubviews()
        setupActions()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public override func layoutSubviews() {
        super.layoutSubviews()
        setupConstraints()
    }
    
    func update(viewModel: Furniture) {
        menuImageView.image = UIImage(imageLiteralResourceName: viewModel.imageName)
        titleLabel.text = viewModel.title
        descriptionLabel.text = viewModel.description
        priceLabel.text = viewModel.price + "$"
    }
}

// MARK: - Actions

extension MenuCell {
    private func setupActions() {
        orderButton.addTarget(self, action: #selector(handleOrder), for: .touchUpInside)
    }
    
    @objc
    private func handleOrder() {
        print("handleOrder")
    }
}

// MARK: - Constraints & Subview

extension MenuCell {
    private func addSubviews() {
        contentView.addSubview(mainStackView)
        [menuImageView, contentStackView].forEach({ mainStackView.addSubview($0) })
        [titleLabel, descriptionLabel, priceAndActionStackView ].forEach({ contentStackView.addSubview($0) })
        [priceLabel, orderButton].forEach({ priceAndActionStackView.addSubview($0) })
    }
    
    private func setupConstraints() {
        mainStackView.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(10)
            $0.trailing.equalToSuperview().inset(10)
            $0.top.equalToSuperview().offset(10)
            $0.bottom.equalToSuperview().inset(10)
        }
        
        menuImageView.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(10)
            $0.top.equalToSuperview().offset(10)
            $0.bottom.equalToSuperview().inset(10)
            $0.height.equalTo(bounds.height - 20)
            $0.width.equalTo(bounds.height - 20)
        }
        
        contentStackView.snp.makeConstraints {
            $0.leading.equalTo(menuImageView.snp.trailing).offset(10)
            $0.trailing.equalToSuperview().inset(10)
            $0.top.equalToSuperview().offset(10)
            $0.bottom.equalToSuperview().inset(10)
        }
        
        titleLabel.snp.makeConstraints {
            $0.leading.equalToSuperview()
            $0.top.equalToSuperview()
            $0.height.equalTo(22)
        }
        
        descriptionLabel.snp.makeConstraints {
            $0.leading.equalToSuperview()
            $0.top.equalTo(titleLabel.snp.bottom)
            $0.width.equalToSuperview().offset(5)
            $0.height.equalTo(44)
        }
        
        priceAndActionStackView.snp.makeConstraints {
            $0.leading.equalToSuperview()
            $0.trailing.equalToSuperview().inset(5)
            $0.top.equalTo(descriptionLabel.snp.bottom)
            $0.bottom.equalTo(contentStackView.snp.bottom)
        }
        
        priceLabel.snp.makeConstraints {
            $0.leading.equalToSuperview()
            $0.top.equalToSuperview()
            $0.bottom.equalToSuperview()
        }
        
        orderButton.snp.makeConstraints {
            $0.trailing.equalToSuperview()
            $0.top.equalToSuperview().offset(7)
            $0.bottom.equalToSuperview().inset(7)
            $0.height.equalTo(30)
            $0.width.equalTo(80)
        }
    }
}
