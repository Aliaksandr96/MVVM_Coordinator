import UIKit
import Combine

final class LoginCoordinator {
    let rootNavigationController: UINavigationController
    private var cancellables: Set<AnyCancellable> = []
    
    init(rootNavigationController: UINavigationController) {
        self.rootNavigationController = rootNavigationController
    }
    
    func start() {
        let viewModel = SignInViewModel()
        let view = SignInView()
        view.viewModel = viewModel
        rootNavigationController.pushViewController(view, animated: true)
        
        viewModel.actionSubject
            .sink(receiveValue: {[weak self] in
                self?.showRegistrationScreen()
            })
            .store(in: &cancellables)
    }
    
    private func showRegistrationScreen() {
       let viewModel = RegistrationViewModel()
        let view = RegistrationView()
        view.viewModel = viewModel
        rootNavigationController.pushViewController(view, animated: true)
    }
}
