# /implement 명령어

$ARGUMENTS 작업을 구현해주세요.

## 지침

1. **입력**: 작업 번호 또는 작업 설명
2. **참조 파일**:
   - `constitution.md` - 코딩 표준 준수
   - 해당 기능의 `SPEC.md` - 요구사항 확인
   - 해당 기능의 `PLAN.md` - 설계 지침 따르기
   - 해당 기능의 `tasks.md` - 작업 컨텍스트 확인

## 구현 프로세스

### 1. 컨텍스트 확인
- tasks.md에서 해당 작업 찾기
- PLAN.md에서 관련 설계 섹션 확인
- SPEC.md에서 관련 요구사항 확인

### 2. 코드 작성
- constitution.md의 코딩 표준 준수
- PLAN.md의 설계 패턴 따르기
- 기존 코드베이스의 스타일과 일관성 유지

### 3. 테스트 작성
- 구현과 함께 테스트 코드 작성 (TDD)
- AAA 패턴 사용 (Arrange, Act, Assert)
- 엣지 케이스 포함

### 4. 문서화
- 복잡한 로직에 주석 추가
- 필요시 README 업데이트

## 코딩 표준 (Quick Reference)

### 네이밍
- 파일명: `kebab-case` (예: `user-service.js`)
- 변수/함수: `camelCase` (예: `getUserById`)
- 클래스: `PascalCase` (예: `UserController`)
- 상수: `UPPER_SNAKE_CASE` (예: `MAX_RETRY_COUNT`)

### 코드 구조
- 함수는 단일 책임 원칙(SRP) 준수
- 함수는 20줄 이하로 유지
- 깊은 중첩 피하기 (최대 3단계)
- Early return 활용

### 에러 처리
- 모든 에러는 적절히 처리
- 구체적인 에러 타입 사용
- 에러 로깅 포함

### 주석
```javascript
// Good: 왜(Why)를 설명
// 캐시를 사용하여 반복적인 API 호출 방지
const cachedData = cache.get(key);

// Bad: 무엇(What)을 반복
// 변수에 값 할당
const x = 5;
```

## 완료 후

1. 작업 테스트 실행
2. 린트 에러 확인 및 수정
3. tasks.md에서 해당 작업 `[x]`로 표시
4. 필요시 다음 작업으로 진행

## 문제 발생 시

디버깅 과정에서:
- 원인 분석이 되지 않거나
- 반복적으로 수정을 시도하는 경우

→ 작업을 즉시 중단하고 상황을 보고해주세요:
1. 현재까지 파악된 상황
2. 시도한 방법
3. 해결되지 않는 원인
