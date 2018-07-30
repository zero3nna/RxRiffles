import Foundation
import RxSwift

class Riddle3Solution {
    
    func solve(source: Observable<Int>) -> Observable<Int> {
        return source.filter { $0 % 2 == 0 }
    }
}
