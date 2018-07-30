import XCTest
import RxSwift
import RxTest

@testable import RxRiffles

class Riddle2Tests: XCTestCase {

    private var observer: TestableObserver<Int>!

    override func setUp() {
        super.setUp()

        let scheduler = TestScheduler(initialClock: 0)
        observer = scheduler.createObserver(Int.self)
        scheduler.start()
    }

    func testSolve() {
        let input = Observable<Int>.create { obs in
            obs.onNext(-1)
            obs.onNext(0)
            obs.onNext(5)
            obs.onCompleted()
            return Disposables.create()
        }

        _ = Riddle2().solve(source:input).subscribe(observer)
        let expectation = [next(0, 0), next(0, 1), next(0, 6), completed(0)]

        XCTAssertEqual(observer.events, expectation)
    }
}
