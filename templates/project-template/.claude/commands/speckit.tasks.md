# /tasks 명령어

$ARGUMENTS 경로의 PLAN.md를 세분화된 작업 체크리스트(tasks.md)로 분류합니다.

## 개요

PLAN.md 파일 경로를 입력받아 같은 디렉토리에 tasks.md를 생성합니다.

## 실행 단계

1. **컨텍스트 로드**
   - PLAN.md 읽기 (기술 스택, 라이브러리, 프로젝트 구조)
   - SPEC.md 읽기 (사용자 스토리와 우선순위)
   - data-model.md 읽기 (있는 경우)
   - contracts/ 읽기 (있는 경우)

2. **작업 생성**: 사용자 스토리별로 정리

3. **tasks.md 작성**

## tasks.md 형식

```markdown
# 작업: [기능 이름]

## Phase 1: Setup (설정)
- [ ] T001 프로젝트 구조 생성
- [ ] T002 의존성 설치

## Phase 2: Foundational (기반)
- [ ] T003 데이터베이스 마이그레이션 설정
- [ ] T004 [P] 기본 모델 생성

## Phase 3: User Story 1 (P1)
**목표**: [사용자 스토리 1 설명]
**테스트 조건**: [독립적으로 테스트 가능한 조건]

- [ ] T005 [P] [US1] User 모델 생성 in src/models/user.py
- [ ] T006 [US1] UserService 구현 in src/services/user_service.py
- [ ] T007 [US1] /api/users 엔드포인트 생성 in src/routes/users.py

## Phase 4: User Story 2 (P2)
...

## Final Phase: Polish
- [ ] T020 문서 업데이트
- [ ] T021 최종 테스트
```

## 작업 형식 규칙

모든 작업은 반드시 이 형식을 따름:

```
- [ ] [TaskID] [P?] [Story?] 설명 with 파일 경로
```

**구성 요소**:
1. **체크박스**: 항상 `- [ ]`로 시작
2. **Task ID**: 순차 번호 (T001, T002, T003...)
3. **[P] 마커**: 병렬 실행 가능한 경우만 포함
4. **[Story] 라벨**: 사용자 스토리 단계에서만 필수 ([US1], [US2], ...)
5. **설명**: 명확한 액션과 정확한 파일 경로

**예시**:
- ✅ `- [ ] T001 프로젝트 구조 생성`
- ✅ `- [ ] T005 [P] 인증 미들웨어 구현 in src/middleware/auth.py`
- ✅ `- [ ] T012 [P] [US1] User 모델 생성 in src/models/user.py`
- ❌ `- [ ] 모델 생성` (ID, Story 라벨, 파일 경로 누락)

## 단계 구성

1. **Phase 1: Setup** - 프로젝트 초기화
2. **Phase 2: Foundational** - 모든 스토리의 선행 조건
3. **Phase 3+: User Stories** - 우선순위 순서대로 (P1, P2, P3...)
   - 각 단계는 독립적으로 테스트 가능해야 함
4. **Final Phase: Polish** - 마무리 및 교차 관심사

## 작업 분류 원칙

### 원자성
- 각 작업은 1-2시간 내에 완료 가능
- 너무 큰 작업은 분할, 너무 작은 작업은 병합

### 의존성 순서
- 선행 작업이 먼저 오도록 정렬
- 의존성이 있으면 명시

### 필수 포함 항목
- 설정/환경 구성 작업
- 구현 작업
- 테스트 작업 (필요시)
- 문서화 작업

## 완료 후

1. 생성된 tasks.md 경로 보고
2. 요약:
   - 총 작업 수
   - 사용자 스토리별 작업 수
   - 병렬 실행 가능 작업 수
3. 다음 단계 안내: `/implement [작업 설명]`
