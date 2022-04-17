import UIKit
protocol Expandable: AnyObject {
    func expandAvatar()
}

class ProfileTableHeaderView: UIView, Expandable {
    
    var delegate: ProfileViewController?
    var delegatePVC: ExpandProtocol?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        self.addSubview(profileHeaderView)
        activateConstraints()
        profileHeaderView.delegate2 = self
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var heightViewConstraint: NSLayoutConstraint?
    
    private lazy var profileHeaderView: ProfileHeaderView = {
        let view = ProfileHeaderView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    func activateConstraints(){
        heightViewConstraint =  profileHeaderView.heightAnchor.constraint(equalToConstant: 220)
        NSLayoutConstraint.activate([
            profileHeaderView.topAnchor.constraint(equalTo: self.topAnchor),
            profileHeaderView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            profileHeaderView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            heightViewConstraint
        ].compactMap({$0}))
    }
    
    func expandAvatar() {
        delegatePVC?.expanded()
    }
    
}
