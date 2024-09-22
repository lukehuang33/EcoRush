//
//  ChallengeViewController.swift
//  YOLO
//
//  Created by Luke Huang on 9/22/24.
//  Copyright © 2024 Ultralytics. All rights reserved.
//

import Foundation

import UIKit

class ChallengesViewController: UIViewController {

    let challenges = [
        ("Challenge 1", "Pick up 100 bottles before 9/25/24."),
        ("Challenge 2", "Collect 25 cans in one day."),
        ("Challenge 3", "Recycle 20 pieces of garbage in one day."),
        ("Challenge 4", "Collect 10 pieces of garbage in the next hour.")
    ]

    @IBOutlet weak var stackView: UIStackView!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Add some padding around the stack view
        stackView.layoutMargins = UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20)
        stackView.isLayoutMarginsRelativeArrangement = true
        
        // Dynamically add challenge titles and details to the stack view
        for challenge in challenges {
            let containerView = createChallengeView(title: challenge.0, details: challenge.1)
            stackView.addArrangedSubview(containerView)

            // Optionally, add spacing between the challenge sections
            let spacer = UIView()
            spacer.heightAnchor.constraint(equalToConstant: 20).isActive = true
            stackView.addArrangedSubview(spacer)
        }
    }
    
    // Function to create a custom view for each challenge
    func createChallengeView(title: String, details: String) -> UIView {
        // Create a container view for the challenge
        let containerView = UIView()
        containerView.backgroundColor = UIColor(white: 0.95, alpha: 1)
        containerView.layer.cornerRadius = 10
        containerView.layer.shadowColor = UIColor.black.cgColor
        containerView.layer.shadowOpacity = 0.1
        containerView.layer.shadowOffset = CGSize(width: 0, height: 2)
        containerView.layer.shadowRadius = 4
        containerView.translatesAutoresizingMaskIntoConstraints = false

        // Create a vertical stack to hold the title and details
        let challengeStack = UIStackView()
        challengeStack.axis = .vertical
        challengeStack.spacing = 8
        challengeStack.translatesAutoresizingMaskIntoConstraints = false
        
        // Title Label
        let titleLabel = UILabel()
        titleLabel.text = title
        titleLabel.font = UIFont.boldSystemFont(ofSize: 24)
        titleLabel.textColor = .black
        titleLabel.numberOfLines = 0

        // Details Label
        let detailsLabel = UILabel()
        detailsLabel.text = details
        detailsLabel.font = UIFont.systemFont(ofSize: 18)
        detailsLabel.textColor = .darkGray
        detailsLabel.numberOfLines = 0

        // Add title and details to the vertical stack
        challengeStack.addArrangedSubview(titleLabel)
        challengeStack.addArrangedSubview(detailsLabel)
        
        // Add the stack to the container view
        containerView.addSubview(challengeStack)
        
        // Add padding around the challengeStack within the container
        challengeStack.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 16).isActive = true
        challengeStack.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -16).isActive = true
        challengeStack.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 16).isActive = true
        challengeStack.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -16).isActive = true
        
        // Ensure the containerView has no intrinsic size issue
        containerView.heightAnchor.constraint(greaterThanOrEqualToConstant: 50).isActive = true
        
        return containerView
    }
}

