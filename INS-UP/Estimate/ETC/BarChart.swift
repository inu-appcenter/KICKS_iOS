//
//  BarChart.swift
//  INS-UP
//
//  Created by Cho on 15/11/2019.
//  Copyright © 2019 Cho. All rights reserved.
//

import UIKit

class BarChart: UIStackView {
    
    private var values: [String : (Float, UIColor, UIProgressView)]!
    private var titles: [String] = []
    private var maxValue: Float = 0.0
    private var barHeight: CGFloat = 4.0
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.axis = .vertical
        self.alignment = .fill
        self.distribution = .fillEqually
        
        values = Dictionary()
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setBarHeight(_ height: CGFloat) {
        barHeight = height
    }
    
    func setUnitLable(text: String) -> BarChart {
        let label = UILabel()
        label.text = text
        label.font = UIFont.systemFont(ofSize: 18)
        
        self.addSubview(label)
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        label.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        
        return self
    }
    
    func setMaxValue(_ max: Float) {
        maxValue = max
    }
    
    func addValue(value: Float, title: String, color: UIColor? = nil) -> BarChart {
        if let color = color {
            let progress = UIProgressView()
            progress.backgroundColor = .clear
            progress.tintColor = .clear
            progress.trackTintColor = .clear
            progress.progressTintColor = color
            
            self.addArrangedSubview(progress)
            
            values.updateValue((value, color, progress), forKey: title)
        } else {
            let random = UIColor.random
            
            let progress = UIProgressView()
            progress.backgroundColor = .clear
            progress.tintColor = .clear
            progress.trackTintColor = .clear
            progress.progressTintColor = random
            
            self.addArrangedSubview(progress)
            
            values.updateValue((value, random, progress), forKey: title)
        }
        
        if value > maxValue {
            maxValue = value
        }
        
        titles.append(title)
        
        return self
    }
    
    func set(borderColor: UIColor = .lightGray, border: [UIRectEdge] = [.bottom, .left], borderWidth: CGFloat = 0.5) {
        for key in values.keys {
            for subView in self.subviews {
                if let progress = subView as? UIProgressView {
                    if progress == values[key]!.2 {
                        progress.setProgress(values[key]!.0 / maxValue, animated: true)
                    }
                }
            }
        }
        
        self.layoutMargins = UIEdgeInsets(top: (self.frame.height / CGFloat(titles.count)) / 2 - (barHeight / 2), left: 0, bottom: (self.frame.height / CGFloat(titles.count)) / 2 - (barHeight / 2), right: self.frame.width / 2)
        self.isLayoutMarginsRelativeArrangement = true
        self.spacing = (self.frame.height / CGFloat(titles.count)) - barHeight
        
        for key in values.keys {
            for subView in self.subviews {
                if let progress = subView as? UIProgressView {
                    if progress == values[key]!.2 {
                        progress.layer.sublayers![1].cornerRadius = (barHeight / 2)
                        progress.layer.sublayers![1].maskedCorners = [.layerMaxXMaxYCorner, .layerMaxXMinYCorner]
                        progress.subviews[1].clipsToBounds = true
                        
                        let label = UILabel()
                        label.text = "\(values[key]!.0)"
                        label.font = UIFont.systemFont(ofSize: 12)
                        progress.addSubview(label)
                        label.translatesAutoresizingMaskIntoConstraints = false
                        label.leadingAnchor.constraint(equalTo: progress.leadingAnchor, constant: ((progress.frame.width / 2) * CGFloat(values[key]!.0 / maxValue)) + 15).isActive = true
                    }
                }
            }
        }
        
        self.layer.addBorder(border, color: borderColor, width: borderWidth)
    }
    
}

