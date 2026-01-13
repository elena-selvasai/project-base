# /plan 명령어

$ARGUMENTS 경로의 SPEC.md에 대한 구현 계획(PLAN.md)을 작성해주세요.

## 지침

1. **입력**: SPEC.md 파일 경로
2. **출력**: 같은 디렉토리에 PLAN.md 생성
3. **참조 파일**:
   - 해당 SPEC.md - 요구사항 확인
   - `constitution.md` - 코딩 표준, 아키텍처 지침 준수

## PLAN.md 필수 섹션

### 1. 목표 (Goal)
- 구현할 내용 요약

### 2. 헌법 준수 확인 (Compliance Check)
```markdown
- [x] 코딩 표준 준수
- [x] 테스트 전략 준수
- [x] 보안 지침 준수
- [x] 아키텍처 원칙 준수
```

### 3. 아키텍처 개요 (Architecture Overview)
- 고수준 설계 (Mermaid 다이어그램 포함)
- 기술 스택 및 선택 이유
- 사용할 디자인 패턴

### 4. 컴포넌트별 변경사항 (Proposed Changes)
각 컴포넌트마다:
- 목적
- 새 파일 (경로, 주요 함수/클래스)
- 수정할 파일 (변경 내용)

### 5. 구현 단계 (Implementation Steps)
단계별로:
- 체크리스트 형태의 작업 목록
- 예상 소요 시간

### 6. 의존성 (Dependencies)
- 외부 패키지 (버전 포함)
- 내부 모듈
- 선행 기능

### 7. 데이터 흐름 (Data Flow)
- Mermaid 시퀀스 다이어그램

### 8. 에러 처리 (Error Handling)
- 에러 유형 및 처리 전략
- 로깅 전략

### 9. 보안 조치 (Security Measures)
- 체크리스트 형태

### 10. 테스트 전략 (Testing)
- 단위 테스트
- 통합 테스트
- E2E 테스트

### 11. 검증 계획 (Verification Plan)
- 자동화된 테스트
- 수동 검증 항목

## 작성 원칙

- constitution.md의 모든 규칙 준수
- SPEC.md의 모든 요구사항이 계획에 반영되었는지 확인
- 현실적인 시간 추정
- 위험 요소 조기 식별
