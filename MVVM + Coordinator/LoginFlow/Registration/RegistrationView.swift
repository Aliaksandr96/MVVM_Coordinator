import UIKit
import Combine

final class RegistrationView: UIViewController {
    // MARK: - Properties
    
    // MARK: Public
    var viewModel: RegistrationViewModel!
    
    // MARK: Private
    private var cancellables: Set<AnyCancellable> = []
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupSubviews()
        setupConstraints()
        configureUI()
        setupBehavior()
        setupBindings()
    }
    // MARK: - API
    private func setupBindings() {
        viewModel.titleSubject
            .sink { [weak self] title in
                self?.title = title
            }
            .store(in: &cancellables)
    }
    // MARK: - Setups
    private func setupSubviews() {
        
    }
    private func setupConstraints() {
        
    }
    private func configureUI() {
        view.backgroundColor = .systemOrange
    }
    private func setupBehavior() {
        
    }
    // MARK: - Helpers
    // MARK: - Extensions
}
