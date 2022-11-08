import UIKit
import Combine

final class SignInView: UIViewController {
    // MARK: - Properties
    
    // MARK: Public
    var viewModel: SignInViewModel!
    
    // MARK: Private
    private let actionButton = UIButton()
    private var cancellables: Set<AnyCancellable> = []
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupSubviews()
        setupConstraints()
        configureUI()
        setupBehavior()
        configureBindings()
    }
    // MARK: - API
    private func configureBindings() {
        viewModel.titleSubject
            .sink { [weak self] title in
                self?.title = title
            }
            .store(in: &cancellables)
    }
    // MARK: - Setups
    private func setupSubviews() {
        view.addSubview(actionButton)
    }
    private func setupConstraints() {
        actionButton.translatesAutoresizingMaskIntoConstraints = false
        actionButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        actionButton.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        actionButton.widthAnchor.constraint(equalToConstant: 150).isActive = true
        actionButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
    }
    private func configureUI() {
        view.backgroundColor = .white
        
        actionButton.setTitle("Tap Me!", for: .normal)
        actionButton.setTitleColor(.black, for: .normal)
    }
    private func setupBehavior() {
        actionButton.addTarget(self, action: #selector(actionButtonDidTapped), for: .touchUpInside)
    }
    // MARK: - Helpers
    @objc private func actionButtonDidTapped() {
        viewModel.actionSubject.send()
    }
    // MARK: - Extensions
}
