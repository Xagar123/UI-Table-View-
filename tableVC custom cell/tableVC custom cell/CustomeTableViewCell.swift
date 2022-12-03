//
//  CustomeTableViewCell.swift
//  tableVC custom cell
//
//  Created by Admin on 30/11/22.
//

import UIKit

class CustomeTableViewCell: UITableViewCell {

//    lazy var backView: UIView = {
//        let view = UIView()
//        view.backgroundColor = UIColor.white
//        return view
//    }()
    
    
    lazy var namelbl:UILabel = {
        let lbl = UILabel()
        
        lbl.font = UIFont.boldSystemFont(ofSize: 22)
        lbl.textAlignment = .left
        return lbl
    }()
    
    lazy var secondlbl:UILabel = {
        let lbl = UILabel()
        lbl.text = "XYZ"
        lbl.font = UIFont.boldSystemFont(ofSize: 22)
        lbl.textAlignment = .left
        return lbl
    }()
    
    lazy var agelbl:UILabel = {
        let lbl = UILabel()
        
        //lbl.font = UIFont.boldSystemFont(ofSize: 18)
        lbl.textAlignment = .left
        lbl.numberOfLines = 0
        //lbl.sizeToFit()
        //lbl.lineBreakMode = .byWordWrapping
        return lbl
    }()
    
    
    lazy var userImage: UIImageView = {
        let userImage = UIImageView()
        userImage.backgroundColor = UIColor.black
        userImage.contentMode = .scaleAspectFill
        return userImage
    }()
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func layoutSubviews() {
        contentView.backgroundColor = UIColor.clear
       // backgroundColor = UIColor.clear
//        backView.layer.cornerRadius = 5
//        backView.clipsToBounds = true
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
//        addSubview(backView)
//        backView.addSubview(userImage)
//        backView.addSubview(namelbl)
//        backView.addSubview(agelbl)
        setupUI()
        
    }
    
    func setupUI(){
        addSubview(userImage)
        userImage.translatesAutoresizingMaskIntoConstraints = false
//        userImage.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        userImage.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 20).isActive = true
        userImage.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        userImage.heightAnchor.constraint(equalToConstant: 80).isActive = true
        userImage.widthAnchor.constraint(equalToConstant: 80).isActive = true
        
        let stackView = UIStackView(arrangedSubviews: [namelbl, agelbl,secondlbl])
        stackView.axis = .vertical
        stackView.spacing = 5
        addSubview(stackView)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        //stackView.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        stackView.leftAnchor.constraint(equalTo: userImage.rightAnchor, constant: 50).isActive = true
        stackView.topAnchor.constraint(equalTo: self.topAnchor, constant: 10).isActive = true
        stackView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -10).isActive = true
        stackView.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -30).isActive = true
    }

}
