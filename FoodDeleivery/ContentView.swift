//
//  ContentView.swift
//  FoodDeleivery
//
//  Created by ر on 10/02/1442 AH.
//  Copyright © 1442 r. All rights reserved.
//

import SwiftUI
class Foodcontroller:UICollectionViewController{
    init(){
//        let layout = UICollectionViewFlowLayout()

        super.init(collectionViewLayout: Foodcontroller.createlayout())
    }
    
        static func createlayout() -> UICollectionViewCompositionalLayout{
            return UICollectionViewCompositionalLayout { (sectionnum, env) -> NSCollectionLayoutSection? in
                if  sectionnum == 0 {
                let item = NSCollectionLayoutItem(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1)))
                                item.contentInsets.trailing = 2
                                item.contentInsets.bottom  = 16
                let group = NSCollectionLayoutGroup.horizontal(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .absolute(200)), subitems: [item])
                let section = NSCollectionLayoutSection(group: group)
                    section.orthogonalScrollingBehavior = .paging
                return section
                }else if sectionnum == 1{
                    let item = NSCollectionLayoutItem(layoutSize: .init(widthDimension: .fractionalWidth(0.25), heightDimension: .absolute(150)))
                item.contentInsets.trailing = 16
                item.contentInsets.bottom  = 16
                    let group = NSCollectionLayoutGroup.horizontal(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .estimated(500)), subitems: [item])
                   

             
    
                let section = NSCollectionLayoutSection(group: group)
                     section.contentInsets.leading = 16
                return section
                }else if sectionnum == 2 {
                    let item = NSCollectionLayoutItem(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1)))
                                item.contentInsets.trailing = 16
                    let group = NSCollectionLayoutGroup.horizontal(layoutSize: .init(widthDimension: .fractionalWidth(0.8), heightDimension: .estimated(125)), subitems: [item])
                                   

                             
                    
                let section = NSCollectionLayoutSection(group: group)
                    section.contentInsets.leading = 16
                    section.orthogonalScrollingBehavior = .continuous

                    return section
                }else {
                    let item = NSCollectionLayoutItem(layoutSize: .init(widthDimension: .fractionalWidth(0.5), heightDimension: .absolute(300)))
                                item.contentInsets.trailing = 16
                    let group = NSCollectionLayoutGroup.horizontal(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .estimated(1000)), subitems: [item])
                                   

                             
                    
                let section = NSCollectionLayoutSection(group: group)
                    section.contentInsets = .init(top: 32, leading: 16, bottom: 0, trailing: 0)
                    

                    return section
                }
            }
        }
    let cellid = "cellid"
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if section == 0 {
            return 3
        }
        return 8
    }
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
         4
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellid, for: indexPath)
        cell.backgroundColor = .red
        return cell
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.backgroundColor = .white
        navigationItem.title = "Food Delivery"
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: cellid)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

struct ContentView: View {
    var body: some View {
        Text("Hello, World!")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Container().edgesIgnoringSafeArea(.all)
    }
}
struct Container:UIViewControllerRepresentable{
    func makeUIViewController(context:Context) -> UIViewController {
        UINavigationController(rootViewController: Foodcontroller())
        
    }
    
    func updateUIViewController(_ uiViewController: UIViewController, context: Context) {
        
    }
    typealias UIViewControllerType  = UIViewController
}
