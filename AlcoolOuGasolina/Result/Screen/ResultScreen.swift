//
//  ResultScreen.swift
//  AlcoolOuGasolina
//
//  Created by João Pedro on 03/07/23.
//

import UIKit

protocol ResultScreenDelegate: AnyObject {
    func tappedBackButton()
    func tappedCalculateButton()
}

class ResultScreen: UIView {
    
    private weak var delegate: ResultScreenDelegate?
    
    public func delegate(delegate: ResultScreenDelegate?) {
        self.delegate = delegate
    }
    
    // Imagem - BackGround
    lazy var backGroundImageView: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "BG BLUR")
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    // Logo
    lazy var logoAppImageView: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "LOGO menor")
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    // Resultado - Label
    lazy var sentenceLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.font = UIFont.boldSystemFont(ofSize: 31)
        label.text = "Abasteça com:"
        return label
    }()
    
    // Resultado - Label (Alcool / Gasolina)
    lazy var resultLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.font = UIFont.boldSystemFont(ofSize: 73)
        label.text = "Gasolina"
        return label
    }()
    
    // Botão Calcular
    lazy var backButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(named: "Botão Back"), for: .normal)
        button.addTarget(self, action: #selector(tappedBackButton), for: .touchUpInside)
        return button
    }()
    
    @objc func tappedBackButton() {
        delegate?.tappedBackButton()
    }

    // Botão Voltar
    lazy var calculateButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Calcular Novamente", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        button.setTitleColor(.black, for: .normal)
        button.clipsToBounds = true
        button.layer.cornerRadius = 8
        button.backgroundColor = UIColor(red: 255/255, green: 223/255, blue: 43/255, alpha: 1.0)
        button.addTarget(self, action: #selector(tappedCalculateButton), for: .touchUpInside)
        return button
    }()
    
    @objc func tappedCalculateButton() {
        delegate?.tappedCalculateButton()
    }
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(backGroundImageView)
        addSubview(logoAppImageView)
        addSubview(sentenceLabel)
        addSubview(resultLabel)
        addSubview(calculateButton)
        addSubview(backButton)
        configConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func configConstraints() {
        NSLayoutConstraint.activate([
            // Image - BackGround
            backGroundImageView.topAnchor.constraint(equalTo: topAnchor),
            backGroundImageView.trailingAnchor.constraint(equalTo: trailingAnchor),
            backGroundImageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            backGroundImageView.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            // Logo
            logoAppImageView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 60),
            logoAppImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            logoAppImageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            
            // Resultado - Label
            sentenceLabel.topAnchor.constraint(equalTo: logoAppImageView.bottomAnchor, constant: 180),
            sentenceLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            // Resultado - Label (Alcool / Gasolina)
            resultLabel.topAnchor.constraint(equalTo: sentenceLabel.bottomAnchor, constant: 12),
            resultLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            // -- Botões --
            //Botão Calcular novamente
            calculateButton.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -135),
            calculateButton.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 60),
            calculateButton.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -60),
            calculateButton.heightAnchor.constraint(equalToConstant: 44),
            
            // Botão Voltar
            backButton.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            backButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),

        ])
    }
}
