//
//  EstimateMainViewController.swift
//  INS-UP
//
//  Created by Cho on 15/11/2019.
//  Copyright © 2019 Cho. All rights reserved.
//

import UIKit

class EstimateMainViewController: UIViewController {

    @IBOutlet weak var titleContainerView: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var estimateTableView: UITableView!
    @IBOutlet weak var compareButton: UIButton!
    
    @IBAction func compareTapped(_ sender: Any) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "Compare") as! EstimateCompareViewController
        self.navigationController?.pushViewController(vc, animated: true)
    }
    let cellID = "ECell"
    let imgNames = ["pr1", "pr2", "pr3"]
    let dates = ["2019.10.26", "2019.10.24", "2019.10.23"]
    let sectionNames = ["보낸 견적", "받은 견적"]
    let titles = ["아크릴 제작 견적 드립니다", "요청하신 견적 입니다.", "아크릴 견적서"]
    let subTitles = ["용문아크릴 | 비금속", "두콩산업 | 비금속", "성은공단 | 비금속"]
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        if #available(iOS 13.0, *) {
            return .darkContent
        } else {
            return .default
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setVisualDesigns()
        // Do any additional setup after loading the view.
    }
    
}

//MARK: Visual Initializers
extension EstimateMainViewController {
    
    func setVisualDesigns() {
        self.view.backgroundColor = .white
        setTitleViewLabel()
        setButton()
        setEstimateTableView()
    }
    
    func setTitleViewLabel() {
        titleContainerView.backgroundColor = .white
        titleLabel.textColor = UIColor.InsUpColor.black
        titleLabel.text = "견적"
        titleLabel.font = .MGothic(type: .m, size: 25, isFix: true)
    }
    
    func setButton() {
        compareButton.backgroundColor = UIColor.InsUpColor.red
        compareButton.setTitle("받은 견적 비교", for: .normal)
        compareButton.setTitleColor(.white, for: .normal)
        compareButton.layer.cornerRadius = 22.5
        compareButton.titleLabel?.font = .MGothic(type: .m, size: 14)
    }
    
    func setEstimateTableView() {
        estimateTableView.backgroundColor = .white
        estimateTableView.separatorStyle = .none
        estimateTableView.dataSource = self
        estimateTableView.delegate = self
    }
}

extension EstimateMainViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = UIView()
        
        let label = UILabel(frame: CGRect(x: 35, y: 10, width: self.view.frame.width, height: 30))
        label.font = .MGothic(type: .m, size: 12)
        label.text = sectionNames[section]
        label.textColor = UIColor.InsUpColor.black
        
        view.addSubview(label)
        
        return view
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 20
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let view = UIView()
        
        view.backgroundColor = UIColor.InsUpColor.lightgray
        
        return view
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        if section == 0 {
            return 5
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        } else {
            return 3
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: cellID) as! EstimateCell
            cell.dateLabel.text = "2019.10.23"
            cell.productImageVIew.image = UIImage(named: "order")
            cell.titleLabel.text = "아크릴 제작"
            cell.subTitleLabel.text = "멋진 의자 제작 프로젝트"
            cell.categoryLabel.text = "비금속 > 아크릴"
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: cellID) as! EstimateCell
            cell.dateLabel.text = dates[indexPath.row]
            cell.categoryLabel.isHidden = true
            cell.productImageVIew.image = UIImage(named: imgNames[indexPath.row])
            cell.titleLabel.text = titles[indexPath.row]
            cell.subTitleLabel.text = subTitles[indexPath.row]
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath)
        cell?.isSelected = false
    }
}

class EstimateCell: UITableViewCell {
    @IBOutlet weak var productImageVIew: UIImageView!
    
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subTitleLabel: UILabel!
    @IBOutlet weak var categoryLabel: UILabel!
    
    override func awakeFromNib() {
        dateLabel.font = .MGothic(type: .r, size: 13)
        dateLabel.textColor = UIColor.InsUpColor.gray
        
        titleLabel.font = .MGothic(type: .sb, size: 15)
        titleLabel.textColor = UIColor.InsUpColor.black
        
        subTitleLabel.font = .MGothic(type: .r, size: 13)
        subTitleLabel.textColor = UIColor.InsUpColor.darkGrey
        
        categoryLabel.font = .MGothic(type: .r, size: 11)
        categoryLabel.textColor = UIColor.InsUpColor.gray
    }
}
