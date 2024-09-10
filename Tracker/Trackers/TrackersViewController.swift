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
    
    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        let element = UICollectionView(frame: .zero, collectionViewLayout: layout)
        element.translatesAutoresizingMaskIntoConstraints = false
        element.backgroundColor = .white // Устанавливаем фон для тестов
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
    
    // MARK: - UI and Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setView()
        setupConstraints()
        
        setupNavigationBar()
        showStub()
        
        collectionView.register(
            TrackerCell.self,
            forCellWithReuseIdentifier: TrackerCell.identifier
        )
        collectionView.dataSource = self
        collectionView.delegate = self
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
        
        let datePicker = UIDatePicker()
        datePicker.datePickerMode = .date
        datePicker.locale = Locale(identifier: "ru_RU")
        navigationItem.rightBarButtonItem = UIBarButtonItem(customView: datePicker)
    }
    
    @objc private func addTrackerTapped() {
        print("Добавить трекер")
    }
    
    private func showStub() {
        stubStackView.isHidden = true
    }
    
    private func setView() {
        view.addSubview(mainStackView)
        mainStackView.addArrangedSubview(titleLabel)
        mainStackView.addArrangedSubview(searchBar)
        mainStackView.addArrangedSubview(collectionView)
        collectionView.addSubview(stubStackView)
        stubStackView.addArrangedSubview(stubImage)
        stubStackView.addArrangedSubview(stubLabel)
    }
    
    // MARK: - Actions
    
}


// MARK: - UICollectionViewDataSource, UICollectionViewDelegateFlowLayout

extension TrackersViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TrackerCell.identifier, for: indexPath) as? TrackerCell else {
            return UICollectionViewCell()
        }
        
//        cell.backgroundColor = .red
        return cell
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    // Настройка размера ячеек
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let spacing: CGFloat = 9
        let numberOfItemsPerRow: CGFloat = 2
        let totalSpacing = (numberOfItemsPerRow - 1) * spacing
        let availableWidth = collectionView.frame.width - totalSpacing
        let width = availableWidth / numberOfItemsPerRow
        
        return CGSize(width: width, height: 148)
    }
    
    // Настройка горизонтальных отступов
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 9
    }
    
    // Настройка вертикальных отступов
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0 
    }
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
            
            collectionView.topAnchor.constraint(equalTo: searchBar.bottomAnchor, constant: 10),
            collectionView.leadingAnchor.constraint(equalTo: mainStackView.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: mainStackView.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: mainStackView.bottomAnchor),
            
            stubStackView.centerXAnchor.constraint(equalTo: collectionView.centerXAnchor),
            stubStackView.centerYAnchor.constraint(equalTo: collectionView.centerYAnchor),
            stubStackView.leadingAnchor.constraint(equalTo: collectionView.leadingAnchor),
            stubStackView.trailingAnchor.constraint(equalTo: collectionView.trailingAnchor),
            stubImage.widthAnchor.constraint(equalToConstant: 80),
            stubImage.heightAnchor.constraint(equalToConstant: 80),
        ])
    }
}
