//
//  HomeScreen.swift
//  AlcoolOuGasolina
//
//  Created by João Pedro on 01/07/23.
//

import UIKit


protocol HomeScreenDelegate: AnyObject {
    func tappedCalculateButton()
    
    func tappedBackButton()
}

class HomeScreen: UIView {
    
    private weak var delegate: HomeScreenDelegate?
    
    public func delegate(delegate: HomeScreenDelegate?) {
        self.delegate = delegate
    }
    
    // Imagem - BackGround
    lazy var backgroundImageView: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "BG BLUR")
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    // Logo - Imagem
    lazy var logoAppImageView: UIImageView = {
       let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "LOGO")
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    // Label - Carro
    lazy var carLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.font = UIFont.boldSystemFont(ofSize: 30)
        label.text = "Carro: Yaris o BRABO"
        return label
    }()
    
    // Label - Motorista
    lazy var driverLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.text = "Motorista: Monica"
        return label
    }()

    // Preço Alcool
    lazy var ethanolPriceTextField: UITextField = {
        let tf = UITextField()
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.autocorrectionType = .no
        tf.backgroundColor = .white
        tf.borderStyle = .roundedRect
        tf.keyboardType = .decimalPad
        
        let placeholderAttributes: [NSAttributedString.Key: Any] = [
            .foregroundColor: UIColor.black, // Cor
            .font: UIFont.systemFont(ofSize: 14) //  Fonte
        ]
        tf.attributedPlaceholder = NSAttributedString(string: "Preço do Álcool", attributes: placeholderAttributes)
        
        tf.textColor = .black
        tf.addDoneButtonOnKeyboard()
        return tf
    }()
    
    // Preço Gasolina
    lazy var gasPriceTextField: UITextField = {
        let tf = UITextField()
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.autocorrectionType = .no
        tf.backgroundColor = .white
        tf.borderStyle = .roundedRect
        tf.keyboardType = .decimalPad
        
        let placeholderAttributes: [NSAttributedString.Key: Any] = [
            .foregroundColor: UIColor.black, // Cor
            .font: UIFont.systemFont(ofSize: 14) //  Fonte
        ]
        tf.attributedPlaceholder = NSAttributedString(string: "Preço da Gasolina", attributes: placeholderAttributes)
        
        tf.textColor = .black
        tf.addDoneButtonOnKeyboard()
        return tf
    }()
    
    
    // Botão Calculatr
    lazy var calculateButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Calcular", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        button.setTitleColor(.black, for: .normal)
        button.layer.cornerRadius = 10
        //button.backgroundColor = UIColor(red: 128/255, green: 128/255, blue: 128/255, alpha: 1.0)
        button.backgroundColor = UIColor(red: 255/255, green: 223/255, blue: 43/255, alpha: 1.0)
        button.addTarget(self, action: #selector(tappedCalculateButton), for: .touchUpInside)
        return button
    }()
    

    @objc func tappedCalculateButton() {
        //      print(#function)
        delegate?.tappedCalculateButton()

    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(backgroundImageView)
        addSubview(carLabel)
        addSubview(driverLabel)
        addSubview(ethanolPriceTextField)
        addSubview(gasPriceTextField)
        addSubview(calculateButton)
        

        configConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func configConstraints() {
        NSLayoutConstraint.activate([
            
            // Imagem - BackGround
            backgroundImageView.topAnchor.constraint(equalTo: topAnchor),
            backgroundImageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            backgroundImageView.trailingAnchor.constraint(equalTo: trailingAnchor),
            backgroundImageView.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            // Carro - Label
            carLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 65),
            carLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            carLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            
            // Motorista - Label
            driverLabel.topAnchor.constraint(equalTo: carLabel.bottomAnchor, constant: 10),
            driverLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            driverLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            
            // Preço Alcool
            ethanolPriceTextField.topAnchor.constraint(equalTo: driverLabel.bottomAnchor,constant: 50),
            ethanolPriceTextField.leadingAnchor.constraint(equalTo: leadingAnchor,constant: 20),
            ethanolPriceTextField.trailingAnchor.constraint(equalTo: trailingAnchor,constant: -20),
            
            // Preço Gasolina
            gasPriceTextField.topAnchor.constraint(equalTo: ethanolPriceTextField.bottomAnchor,constant: 50),
            gasPriceTextField.leadingAnchor.constraint(equalTo: leadingAnchor,constant: 20),
            gasPriceTextField.trailingAnchor.constraint(equalTo: trailingAnchor,constant: -20),
            
            // Botão Calcular -
            calculateButton.topAnchor.constraint(equalTo: gasPriceTextField.bottomAnchor, constant: 50),
            calculateButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            calculateButton.trailingAnchor.constraint(equalTo: trailingAnchor,constant: -20),
//            calculateButton.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -125),
//            calculateButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 60),
//            calculateButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -60),
//            calculateButton.heightAnchor.constraint(equalToConstant: 44),
            
        ])
    }
}
