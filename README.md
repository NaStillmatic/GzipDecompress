# GzipDecompress

**Gzip** 압축을 풀어주는 Swift 샘플입니다.


### 사용한 라이브러리
- GzipSwift
- RxSwift
- Snapkit

압축해제된 데이터는 **EUC-KR** 최종 변환되는데 인코딩이 다른 경우이면   
아래 코드처럼 `toString(encoding: String.Encoding = .utf8)` 를 사용하세요.

```swift

// StringEx.swif

extension String {

    ...

    var gunzipped: String? {
        guard let gzipData = self.decodeBase64Data else { return nil }
        let decompressedData = try? gzipData.gunzipped()
        return decompressedData?.eucKrString
        // return decompressedData?.toString() // 문자열이 UTF8일경우 
    }
}

```

