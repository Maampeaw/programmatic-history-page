//
//  ViewController.swift
//  historyPageCode
//
//  Created by user on 6/14/22.
//

import UIKit

class ViewController: UIViewController {
    var segmentedControl: UISegmentedControl!
    var label: UILabel!
    var search: UISearchBar!
    var stackView: UIStackView!
    var bars: UIButton!
    var capsule: UIButton!
    var tableView: UITableView!
    var activityIndicator: UIActivityIndicatorView!
    
    var customers = [Customer(time: "3:00pm", isFavorite: true, imageName: "MTN Mobile Money", name1: "Richard Blankson", name2: "George Koomson", amount: "500", currency: "GHS", contact: "0244040112"), Customer(time: "4:00pm", isFavorite: false, imageName: "images", name1: "Absa Bank", name2: "", amount: "500", currency: "GHS", contact: "054327389"), Customer(time: "5:00pm", isFavorite: false, imageName: "images", name1: "Richard Blankson", name2: "George Koomson", amount: "500", currency: "GHS", contact: "054329384")]

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        let myCell = UINib(nibName: String(describing: transactionTableViewCell.self), bundle: nil)
        
//Creating the segmented Control
        segmentedControl = UISegmentedControl(items: ["History", "Transaction Summary"])
        segmentedControl.translatesAutoresizingMaskIntoConstraints = false
        segmentedControl.selectedSegmentIndex = 0
        view.addSubview(segmentedControl)
        
//Creating the stack view that contains the search bar and bars
        search = UISearchBar()
        search.placeholder = "Search"
        search.layer.borderWidth = 1
        search.layer.borderColor = UIColor.white.cgColor
        
//Creating the bars
        bars = UIButton()
//        bars.image = UIImage(systemName: "slider.horizontal.3")
        bars.setImage(UIImage(systemName: "slider.horizontal.3", withConfiguration: UIImage.SymbolConfiguration(pointSize: 30, weight: .medium, scale: .large)), for: .normal)
        bars.tintColor = .black
        bars.translatesAutoresizingMaskIntoConstraints = false
        
//creating the stack View
        stackView = UIStackView(arrangedSubviews: [search, bars])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.distribution = .fill
        stackView.spacing = 10

        view.addSubview(stackView)
        
//Creating the capsule to hold the date
    capsule = UIButton()
    capsule.setTitle("May, 22, 2014", for: .normal)
    capsule.setTitleColor(.darkGray, for: .normal)
    capsule.layer.cornerRadius = 20
        capsule.backgroundColor = UIColor(red: 0.8, green: 0.8, blue: 0.8, alpha: 1)
    capsule.isEnabled = false
    capsule.translatesAutoresizingMaskIntoConstraints = false
        capsule.clipsToBounds = true
        
    view.addSubview(capsule)
        
//adding the tableView
        
        tableView = UITableView()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(myCell, forCellReuseIdentifier: String(describing: transactionTableViewCell.self))
        view.addSubview(tableView)

        let width = view.frame.size.width
        let height = view.frame.size.height
        let button = UIButton(frame: CGRect(x: width/4, y: height-180, width: 200, height: 70))
     
        button.backgroundColor = .green
        button.setTitle("SEND NEW",for: .normal)
//        let image = UIImage(systemName: "plus.circle.fill")
        let largeConfig = UIImage.SymbolConfiguration(pointSize: 30, weight: .bold, scale: .large)
               
        let largeplusImg = UIImage(systemName: "plus.circle.fill", withConfiguration: largeConfig)
        button.setImage(largeplusImg, for: .normal)
        button.tintColor = .white
        button.titleLabel?.font = .systemFont(ofSize: 16)
        button.layer.cornerRadius = 10
//        button.currentImage?.scale = 3
        button.backgroundColor = UIColor(red: 0.004, green: 0.80, blue: 0.70, alpha: 1)
        button.layer.shadowColor = UIColor.gray.cgColor
        button.layer.shadowOffset = .zero
        button.layer.shadowOpacity = 1.0;
       button.layer.shadowRadius = 3
        view.addSubview(button)
        
       
        
        
//        let timer = Timer.scheduledTimer(timeInterval: 1.0, target: ViewController.self, selector: #selector(showActivity), userInfo: nil, repeats: false)
        
        
       
        
//        activityIndicator.stopAnimating()
        
        setUpConstraintsForLayouts()
    }
    

    

    
    
    func setUpConstraintsForLayouts(){
        NSLayoutConstraint.activate([
            segmentedControl.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 30), segmentedControl.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 18), segmentedControl.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -18), segmentedControl.heightAnchor.constraint(equalToConstant: 50)
        ])
        
//        NSLayoutConstraint.activate([
//            label.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 100), label.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 5), label.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 5), label.heightAnchor.constraint(equalToConstant: 70)
//        ])
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: segmentedControl.bottomAnchor, constant: 30),
            stackView.heightAnchor.constraint(equalToConstant: 50),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 18),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -18)

        ])
//
        NSLayoutConstraint.activate([
            bars.widthAnchor.constraint(equalToConstant: 40),
            bars.heightAnchor.constraint(equalToConstant: 30)
        ])
        
        NSLayoutConstraint.activate([
            search.topAnchor.constraint(equalTo: stackView.topAnchor, constant: 0),
            search.bottomAnchor.constraint(equalTo: stackView.bottomAnchor, constant: 0),
            search.leadingAnchor.constraint(equalTo: stackView.leadingAnchor, constant: 0)
        ])
//
        NSLayoutConstraint.activate([
            capsule.topAnchor.constraint(equalTo: stackView.bottomAnchor, constant: 20),
            capsule.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 18),
            capsule.heightAnchor.constraint(equalToConstant: 40),
            capsule.widthAnchor.constraint(equalToConstant: 150)
            
        ])
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: capsule.bottomAnchor, constant: 3),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 0),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0)
            
        ])
    
        
    }
    
    


}



extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: transactionTableViewCell.self)) as! transactionTableViewCell
        cell.time.text = customers[indexPath.row].time
        cell.amount.text = String(format: "%@ %@", customers[indexPath.row].currency, customers[indexPath.row].amount)
        cell.thumbNail.image = UIImage(named: customers[indexPath.row].imageName)
        cell.name1.text = customers[indexPath.row].name1
        cell.name2.text = customers[indexPath.row].name2
        cell.contact.text = customers[indexPath.row].contact
        cell.favourite.isHidden = !customers[indexPath.row].isFavorite
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return customers.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        customers[indexPath.row].isFavorite = !customers[indexPath.row].isFavorite
        tableView.reloadData()
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    
    
    
}

