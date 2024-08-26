import UIKit


class TabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let trackers = TrackersViewController()
        trackers.title = "Трекеры"
        trackers.tabBarItem.image = UIImage(named: "trackers")
        
        
        let statistics = StatisticsViewController()
        statistics.title = "Статистика"
        statistics.tabBarItem.image = UIImage(named: "stats")
        
//        _ = UINavigationController(rootViewController: trackers)
//        _ = UINavigationController(rootViewController: statistics)
//        
        viewControllers = [trackers, statistics]
        
        configureTabBarAppearance()
    }
    
    private func configureTabBarAppearance() {
        let tabBar = self.tabBar
        tabBar.tintColor = .blueYP
    }
}
