import UIKit


class TabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let trackers = TrackersViewController()
        trackers.title = "Трекеры"
        trackers.tabBarItem.image = UIImage(named: "trackers")
        let trackersNav = UINavigationController(rootViewController: trackers)
        
        
        let statistics = StatisticsViewController()
        statistics.title = "Статистика"
        statistics.tabBarItem.image = UIImage(named: "stats")
        let statisticsNav = UINavigationController(rootViewController: statistics)
        
        viewControllers = [trackersNav, statisticsNav]
        
        configureTabBarAppearance()
    }
    
    private func configureTabBarAppearance() {
        let tabBar = self.tabBar
        tabBar.tintColor = .blueYP
        tabBar.unselectedItemTintColor = .grayYP
        
        if #available(iOS 13.0, *) {
            let appearance = UITabBarAppearance()
            appearance.configureWithOpaqueBackground()
            tabBar.standardAppearance = appearance
            if #available(iOS 15.0, *) {
                tabBar.scrollEdgeAppearance = tabBar.standardAppearance
            }
        }
    }
}
