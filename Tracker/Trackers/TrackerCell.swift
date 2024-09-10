import UIKit

final class TrackerCell: UICollectionViewCell {
    
    static let identifier = "TrackerCell"
    
    private lazy var cardView: UIView = {
        let element = UIView()
        element.backgroundColor = .colorSelection2
        element.layer.cornerRadius = 16
        element.layer.borderWidth = 1
        element.layer.borderColor = UIColor.whiteAlpha30.cgColor
        
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()
    
    private lazy var emojiContainerView: UIView = {
        let element = UIView()
        element.backgroundColor = .whiteAlpha30
        element.layer.cornerRadius = 12
        
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()

    private lazy var emojiLabel: UILabel = {
        let element = UILabel()
        element.text = "😉"
        element.font = .systemFont(ofSize: 16)
        element.textAlignment = .center
        
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()
    
    private lazy var nameTrackerLabel: UILabel = {
        let element = UILabel()
        element.text = "Кошка заслонила камеру на созвоне"
        element.font = .systemFont(ofSize: 12)
        element.textColor = .white
        element.numberOfLines = 0
        element.textAlignment = .left
        
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()
    
    private lazy var countDaysLabel: UILabel = {
        let element = UILabel()
        element.text = "1 день"
        element.font = .systemFont(ofSize: 12)
        element.textColor = .blackYPDay
        
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()
    
    private lazy var countDaysButton: UIButton = {
        let element = UIButton(type: .system)
        element.setImage(UIImage(named: "buttonPlus"), for: .normal)
        element.tintColor = .colorSelection2
//        element.backgroundColor = .colorSelection2
//        element.layer.cornerRadius = 17
        element.addTarget(
            self,
            action: #selector(didCountDaysButtonTapped),
            for: .touchUpInside
        )
       
        
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setView()
        setupConstraints()
        
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc private func didCountDaysButtonTapped() {
        print("готово")
    }
    
    private func setView() {
        contentView.addSubview(cardView)
        cardView.addSubview(emojiContainerView)
        emojiContainerView.addSubview(emojiLabel)
        cardView.addSubview(nameTrackerLabel)
        contentView.addSubview(countDaysLabel)
        contentView.addSubview(countDaysButton)
        
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            cardView.topAnchor.constraint(equalTo: contentView.topAnchor),
            cardView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            cardView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            cardView.heightAnchor.constraint(equalToConstant: 90),
            
            emojiContainerView.topAnchor.constraint(equalTo: cardView.topAnchor, constant: 12),
            emojiContainerView.leadingAnchor.constraint(equalTo: cardView.leadingAnchor, constant: 12),
            emojiContainerView.heightAnchor.constraint(equalToConstant: 24),
            emojiContainerView.widthAnchor.constraint(equalToConstant: 24),
            
//            emojiLabel.heightAnchor.constraint(equalToConstant: 22),
//            emojiLabel.widthAnchor.constraint(equalToConstant: 16),
            emojiLabel.centerXAnchor.constraint(equalTo: emojiContainerView.centerXAnchor),
            emojiLabel.centerYAnchor.constraint(equalTo: emojiContainerView.centerYAnchor),
            
            nameTrackerLabel.leadingAnchor.constraint(equalTo: cardView.leadingAnchor, constant: 12),
            nameTrackerLabel.bottomAnchor.constraint(equalTo: cardView.bottomAnchor, constant: -12),
            nameTrackerLabel.trailingAnchor.constraint(equalTo: cardView.trailingAnchor, constant: -12),
            
            countDaysLabel.topAnchor.constraint(equalTo: cardView.bottomAnchor, constant: 16),
            countDaysLabel.leadingAnchor.constraint(equalTo: cardView.leadingAnchor, constant: 12),
            
            countDaysButton.topAnchor.constraint(equalTo: cardView.bottomAnchor, constant: 8),
            countDaysButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -12),
            countDaysButton.heightAnchor.constraint(equalToConstant: 34),
            countDaysButton.widthAnchor.constraint(equalToConstant: 34),
            
        ])
    }
}
