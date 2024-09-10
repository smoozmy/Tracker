import UIKit

final class TrackersViewController: UIViewController {
    
    var categories: [TrackerCategory] = []
    var completedTrackers: [TrackerRecord] = []
    
    private lazy var mainStackView: UIStackView = {
        let element = UIStackView()
        element.axis = .vertical
        
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()
    
    private lazy var stubStackView: UIStackView = {
        let element = UIStackView()
        element.axis = .vertical
        element.spacing = 8
        
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()
    
    private lazy var stubImage: UIImageView = {
        let element = UIImageView()
        element.image = UIImage(named: "EmptyStub")
        element.contentMode = .scaleAspectFit
        
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()
    
    private lazy var stubLabel: UILabel = {
        let element = UILabel()
        element.text = "Что будем отслеживать?"
        element.textAlignment = .center
        element.textColor = .blackYPDay
        element.font = .systemFont(ofSize: 12, weight: .medium)
        
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()
    
    private lazy var scrollView: UIScrollView = {
        let element = UIScrollView()
        
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()
    
    private lazy var titleLabel: UILabel = {
        let element = UILabel()
        element.text = "Трекеры"
        element.textColor = .blackYPDay
        element.font = .systemFont(ofSize: 34, weight: .bold)
        
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()
    
    private lazy var searchBar: UISearchBar = {
        let element = UISearchBar()
        element.placeholder = "Поиск"
        element.searchBarStyle = .minimal
        
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()
    
    
    
    // MARK: - UI and Lyfe Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setView()
        setupConstraints()
        
        setupNavigationBar()
        showStub()
    }
    
    private func setupNavigationBar() {
        navigationItem.title = nil
        
        let addButton = UIBarButtonItem(
            image: UIImage(named: "plus"),
            style: .plain,
            target: self,
            action: #selector(addTrackerTapped)
        )
        addButton.tintColor = .blackYPDay
        
        navigationItem.leftBarButtonItem = addButton
    }
    

    
    @objc private func addTrackerTapped() {
        print("Добавить трекер")
    }
    
    private func showStub() {
        stubStackView.isHidden = false
    }
    
    private func setView() {
        view.addSubview(mainStackView)
        mainStackView.addArrangedSubview(titleLabel)
        mainStackView.addArrangedSubview(searchBar)
        mainStackView.addArrangedSubview(scrollView)
        scrollView.addSubview(stubStackView)
        stubStackView.addArrangedSubview(stubImage)
        stubStackView.addArrangedSubview(stubLabel)
    }
    
    // MARK: - Actions
    
}

// MARK: - Constraints

extension TrackersViewController {
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            mainStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            mainStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            mainStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            mainStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            
            titleLabel.topAnchor.constraint(equalTo: mainStackView.topAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: mainStackView.leadingAnchor),
            titleLabel.trailingAnchor.constraint(equalTo: mainStackView.trailingAnchor),
            
            searchBar.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 7),
            
            stubStackView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
            stubStackView.centerYAnchor.constraint(equalTo: scrollView.centerYAnchor),
            stubStackView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            stubStackView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            stubImage.widthAnchor.constraint(equalToConstant: 80),
            stubImage.heightAnchor.constraint(equalToConstant: 80),
                    
        ])
    }
}

