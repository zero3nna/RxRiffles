import Foundation
import RxSwift

class Riddle10 {
    /**
     * Use the [first] Observable and flatten it with the results of the [function] that returns an Observable.
     *
     * Use case: Get some user data and perform a network request with the user data and have both data accessible afterwards.
     */
    func solve(first: Observable<Int>, function: @escaping (Int) -> Observable<String>) -> Observable<(Int, String)> {
        fatalError()
    }
}
