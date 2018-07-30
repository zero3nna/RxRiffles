import Foundation
import RxSwift

class Riddle4Solution {
    
    func solve(source: Observable<Void>) -> Observable<Bool> {
        return source.scan(false, accumulator: { toggle, _ in
            !toggle
        })
    }
}
