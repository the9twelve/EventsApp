//
//  TitleSubtitleCell.swift
//  EventsApp
//
//  Created by Arqam Owais on 01/10/2020.
//  Copyright © 2020 Arqam Owais. All rights reserved.
//

import Foundation
import UIKit

final class TitleSubtitleCell: UITableViewCell {
    
    private let titleLabel = UILabel()
    private let subtitleTextField = UITextField()
    private let verticalStackView = UIStackView()
    
    private let padding: CGFloat = 15
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupViews()
        setupHierarchy()
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func update(with viewModel: TitleSubtitleCellViewModel) {
        titleLabel.text = viewModel.title
        subtitleTextField.text = viewModel.subtitle
        subtitleTextField.placeholder = viewModel.placeholder
    }
    
    private func setupViews() {
        verticalStackView.axis = .vertical
        titleLabel.font = .systemFont(ofSize: 22, weight: .medium)
        subtitleTextField.font = .systemFont(ofSize: 20, weight: .medium)
        
        [verticalStackView, titleLabel, subtitleTextField].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
    }
    
    private func setupHierarchy() {
        contentView.addSubview(verticalStackView)
        verticalStackView.addArrangedSubview(titleLabel)
        verticalStackView.addArrangedSubview(subtitleTextField)
    }
    
    private func setupLayout() {
        NSLayoutConstraint.activate([
            verticalStackView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: padding),
            verticalStackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: padding),
            verticalStackView.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -padding),
            verticalStackView.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: padding)
        ])
    }
}