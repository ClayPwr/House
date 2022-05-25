//
//  DetailContentView.swift
//  House
//
//  Created by User on 5/15/22.
//

import UIKit

protocol DetailContentViewDelegate: AnyObject {
    func handleOrder(in view: DetailContentView)
}

public final class DetailContentView: UIView {
    
    weak var delegate: DetailContentViewDelegate?
    
    private var menuImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.layer.masksToBounds = true
        imageView.layer.cornerRadius = 12
        return imageView
    }()
    
    private var favoriteImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private var containerStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .fill
        stackView.spacing = 10
        return stackView
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
        label.numberOfLines = 3
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
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        addSubviews()
        setupActions()
        #if APPCLIP
        favoriteImageView.isHidden = true
        #endif
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
        favoriteImageView.image = UIImage(systemName: "star")
        titleLabel.text = viewModel.title
        descriptionLabel.text = viewModel.description
        priceLabel.text = viewModel.price + "$"
    }
    
}

// MARK: - Actions

extension DetailContentView {
    private func setupActions() {
        orderButton.addTarget(self, action: #selector(handleOrder), for: .touchUpInside)
    }
    
    @objc
    private func handleOrder() {
        delegate?.handleOrder(in: self)
    }
}

// MARK: - Constraints & Subview

extension DetailContentView {
    
    private func addSubviews() {
        [menuImageView, containerStackView].forEach { addSubview($0) }
        menuImageView.addSubview(favoriteImageView)
        [titleLabel, descriptionLabel, priceAndActionStackView].forEach { containerStackView.addSubview($0) }
        [priceLabel, orderButton].forEach { priceAndActionStackView.addSubview($0) }
    }
    
    private func setupConstraints() {
        menuImageView.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(10)
            $0.trailing.equalToSuperview().inset(10)
            $0.top.lessThanOrEqualTo(safeAreaLayoutGuide.snp.top).offset(10)
            $0.height.equalTo(bounds.height * 0.4)
        }
        
        favoriteImageView.snp.makeConstraints {
            $0.trailing.equalToSuperview().inset(10)
            $0.top.equalToSuperview().offset(10)
            $0.height.equalTo(24)
            $0.width.equalTo(24)
        }
        
        containerStackView.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(10)
            $0.trailing.equalToSuperview().inset(10)
            $0.top.equalTo(menuImageView.snp.bottom).offset(20)
            $0.height.equalTo(200)
        }
        
        titleLabel.snp.makeConstraints {
            $0.leading.equalToSuperview()
            $0.trailing.equalToSuperview()
            $0.top.equalToSuperview()
        }
        
        descriptionLabel.snp.makeConstraints {
            $0.leading.equalToSuperview()
            $0.trailing.equalToSuperview()
            $0.top.equalTo(titleLabel.snp.bottom).offset(20)
            $0.height.lessThanOrEqualTo(70)
        }
        
        priceAndActionStackView.snp.makeConstraints {
            $0.leading.equalToSuperview()
            $0.trailing.equalToSuperview()
            $0.top.equalTo(descriptionLabel.snp.bottom).offset(20)
            $0.height.equalTo(30)
        }
        
        priceLabel.snp.makeConstraints {
            $0.leading.equalToSuperview()
            $0.top.equalToSuperview()
            $0.bottom.equalToSuperview()
        }
        
        orderButton.snp.makeConstraints {
            $0.trailing.equalToSuperview()
            $0.top.equalToSuperview()
            $0.bottom.equalToSuperview()
            $0.height.equalTo(30)
            $0.width.equalTo(80)
        }
        
    }
}
