# 문제 해결 가이드

Spec-Kit 방법론 적용 시 일반적인 문제와 해결책입니다.

## 프로젝트 설정 문제

### 문제: 디렉토리 구조가 올바르지 않음

**오류**:
```
필수 디렉토리가 누락됨: specs/, src/, tests/
```

**원인**: Spec-Kit 표준 구조가 설정되지 않음.

**해결책**:
```bash
# 프로젝트 루트로 이동
cd your-project

# 필수 디렉토리 생성
mkdir -p src tests specs docs
```

### 문제: 프로젝트 디렉토리가 이미 존재함

**오류**:
```
디렉토리 'my-project'가 이미 존재합니다
```

**원인**: 해당 이름의 프로젝트가 이미 존재함.

**해결책**:
1. **다른 이름 사용**:
   ```bash
   mkdir my-project-v2
   ```

2. **기존 프로젝트 삭제**:
   ```bash
   rm -rf my-project
   ```

3. **기존 프로젝트 이름 변경**:
   ```bash
   mv my-project my-project-old
   ```

### 문제: 권한 오류로 디렉토리 생성 실패

**오류**:
```
Permission denied: cannot create directory
```

**원인**: 해당 경로에 쓰기 권한이 없음.

**해결책**:
```bash
# 권한 확인
ls -la

# 권한 변경 (필요시)
chmod 755 your-directory

# 또는 다른 위치에 프로젝트 생성
```

## 검증 문제

### 문제: 누락된 디렉토리로 검증 실패

**오류**:
```
[WARN] src/ directory is missing (recommended)
[WARN] tests/ directory is missing (recommended)
```

**원인**: 표준 디렉토리가 아직 생성되지 않음.

**해결책**:
```bash
cd your-project
mkdir -p src tests specs docs
```

### 문제: README에 플레이스홀더 텍스트 포함

**경고**:
```
[WARN] README.md contains placeholder text
```

**원인**: 템플릿 플레이스홀더가 교체되지 않음.

**해결책**:
`README.md`를 편집하여 다음을 교체:
- `[Project Name]` → 실제 프로젝트 이름
- `[project-name]` → 프로젝트 식별자
- `[Description]` → 실제 설명
- `[Date]` → 현재 날짜

## Git 문제

### 문제: Git이 초기화되지 않음

**정보**:
```
[INFO] Git repository not initialized
```

**해결책**:
```bash
cd your-project
git init
git add .
git commit -m "feat: 프로젝트 초기화"
```

### 문제: Git 초기화 실패

**원인**: Git이 설치되지 않았거나 PATH에 없음.

**해결책**:
1. **Git 설치 확인**:
   ```bash
   git --version
   ```

2. **Git 설치** (설치되지 않은 경우):
   - [git-scm.com](https://git-scm.com)에서 다운로드
   - 또는 패키지 관리자 사용:
     ```bash
     # macOS
     brew install git
     
     # Ubuntu/Debian
     sudo apt install git
     
     # Windows (chocolatey)
     choco install git
     ```

## Spec-Kit 워크플로우 문제

### 문제: SPEC.md가 AI에게 너무 모호함

**문제점**: AI가 일반적이거나 잘못된 코드를 생성함.

**원인**: 명세에 세부 사항이 부족함.

**해결책**:
더 구체적으로 추가:

❌ **너무 모호함**:
```markdown
## 요구사항
- 사용자 인증
```

✅ **더 나은 예**:
```markdown
## 요구사항
### FR1: 이메일/비밀번호 인증
- 사용자가 이메일과 비밀번호 제공
- bcrypt로 비밀번호 해싱 (cost factor: 12)
- 성공 시 JWT 토큰 반환 (24시간 만료)
- 잘못된 자격 증명 시 401과 오류 메시지 반환

### FR2: 세션 관리
- httpOnly 쿠키에 토큰 저장
- 원활한 갱신을 위한 리프레시 토큰 메커니즘
- 로그아웃 시 서버에서 토큰 무효화
```

### 문제: AI가 헌법을 따르지 않음

**문제점**: 생성된 코드가 코딩 표준을 위반함.

**원인**: AI에게 헌법을 따르라고 명시적으로 알려주지 않음.

**해결책**:
프롬프트에 항상 헌법 포함:

```
다음을 따라 사용자 인증을 구현하세요:
- 명세: specs/auth/SPEC.md
- 계획: specs/auth/PLAN.md
- 헌법: constitution.md

코드가 헌법에 정의된 모든 명명 규칙,
오류 처리 패턴, 보안 지침을 따르는지 확인하세요.
```

### 문제: 구현이 계획에서 벗어남

**문제점**: 코드가 PLAN.md와 일치하지 않음.

**원인**: 구현 중 계획의 문제를 발견함.

**해결책**:
1. **PLAN.md 업데이트**하여 현실 반영
2. **변경 사항 문서화**:
   ```markdown
   ## 원래 계획에서의 변경 사항
   
   ### 변경 1: 데이터베이스 스키마
   **원래**: 단일 `users` 테이블
   **실제**: `users`와 `user_profiles`로 분리
   **이유**: 인증 데이터와 프로필 데이터 분리가
   보안을 개선하고 다른 접근 패턴을 허용함
   ```

## 테스트 문제

### 문제: 테스트 실패

**오류**:
```
FAIL: 5/10 tests failing
```

**디버깅 단계**:

1. **테스트 출력 확인**:
   ```bash
   npm test -- --verbose
   # 또는
   pytest -v
   ```

2. **특정 테스트 실행**:
   ```bash
   npm test -- --testNamePattern="장바구니에 상품을 추가해야 함"
   # 또는
   pytest -k "test_add_item_to_cart"
   ```

3. **인수 조건 확인**:
   - 테스트가 SPEC.md와 일치하는가?
   - 요구사항이 올바르게 이해되었는가?

4. **구현 검토**:
   - 코드가 PLAN.md를 따르는가?
   - 로직 오류가 있는가?

5. **테스트 설정 확인**:
   - 목이 올바르게 구성되었는가?
   - 테스트 데이터가 유효한가?

### 문제: 낮은 테스트 커버리지

**문제점**: 커버리지가 목표 미만 (예: <70%).

**해결책**:

1. **커버되지 않은 코드 식별**:
   ```bash
   npm run test:coverage
   # 또는
   pytest --cov=src --cov-report=html
   ```

2. **누락된 테스트 추가**:
   - 엣지 케이스
   - 오류 시나리오
   - 경계 조건

3. **코드가 테스트 가능한지 확인**:
   - 의존성 추출
   - 의존성 주입 사용
   - 결합도 감소

### 문제: 테스트가 느림

**문제점**: 테스트 스위트가 너무 오래 걸림.

**해결책**:

1. **테스트를 병렬로 실행**:
   ```javascript
   // jest.config.js
   module.exports = {
     maxWorkers: "50%"
   };
   ```

2. **테스트 카테고리 사용**:
   ```bash
   npm run test:unit     # 빠른 단위 테스트
   npm run test:integration  # 느린 통합 테스트
   ```

3. **비용이 많이 드는 작업 목킹**:
   - 데이터베이스 호출
   - 외부 API
   - 파일 I/O

## AI 어시스턴트 문제

### 문제: AI가 컴파일되지 않는 코드 생성

**원인**: AI가 전체 컨텍스트를 갖지 못하거나 가정을 함.

**해결책**:

1. **완전한 컨텍스트 제공**:
   ```
   TypeScript 프로젝트에서 작업 중입니다.
   TypeScript 버전: 5.0
   Strict 모드: 활성화
   
   다음에 대한 코드를 생성하세요...
   ```

2. **오류 메시지 공유**:
   ```
   생성된 코드에 다음 오류가 있습니다:
   [오류 붙여넣기]
   
   수정해 주세요.
   ```

3. **점진적 변경 요청**:
   ```
   전체 파일을 생성하는 대신,
   먼저 함수 시그니처만 보여주세요.
   ```

### 문제: AI가 안전하지 않은 코드 제안

**예시**: 문자열 연결을 사용한 SQL 쿼리.

**해결책**:

1. **헌법 지적**:
   ```
   생성한 코드에 SQL 인젝션 취약점이 있습니다.
   constitution.md의 보안 지침을 검토하고
   매개변수화된 쿼리를 대신 사용하세요.
   ```

2. **안전한 예시 제공**:
   ```
   이 프로젝트에서 데이터베이스 쿼리를 처리하는 방법입니다:
   
   // 기존 코드의 안전한 패턴
   const result = await db.query(
     'SELECT * FROM users WHERE id = $1',
     [userId]
   );
   
   이 패턴을 따라주세요.
   ```

### 문제: AI가 이전 컨텍스트를 잊음

**문제점**: 긴 대화에서 AI가 이전 지시를 잊음.

**해결책**:

1. **컨텍스트 다시 설정**:
   ```
   참고: specs/cart/SPEC.md를 구현 중이며
   constitution.md 표준을 따르고 있습니다.
   ```

2. **더 작은 청크로 분리**:
   - 한 번에 하나의 컴포넌트 완료
   - 새 컴포넌트는 새 대화 시작

3. **명확한 참조 사용**:
   ```
   방금 완료한 CartService 구현에서 계속하세요.
   이제 동일한 패턴을 따라 CartController를 구현하세요.
   ```

### 문제: AI가 디버깅 루프에 갇힘

**문제점**: AI 어시스턴트가 반복적인 수정의 루프에 갇혀 있거나 근본 원인을 식별하지 못함.

**규칙**: 디버깅과 오류 수정 과정에서 원인 분석이 작동하지 않거나 반복 수정이 발생하면, **즉시 멈추고 사용자에게 상황을 알리세요.**

### 문제: 개발 후 실행 오류

**문제점**: 개발 완료 후 실행 검증 중 오류 발생.

**규칙**: 개발은 기본 실행이 정상임을 확인한 후에만 완료된 것으로 간주됩니다. 실행 오류가 발생하면 수정을 시도하세요. 수정이 어렵거나 반복적인 오류가 발생하면, **즉시 멈추고 사용자에게 상황을 알리세요.**

## 의존성 문제

### 문제: npm install 실패

**해결책**:

1. **npm 캐시 정리**:
   ```bash
   npm cache clean --force
   rm -rf node_modules
   rm package-lock.json
   npm install
   ```

2. **Node 버전 확인**:
   ```bash
   node --version
   # 프로젝트 요구사항과 일치하는지 확인
   ```

3. **정확한 버전 사용**:
   ```json
   {
     "dependencies": {
       "express": "4.18.2"
     }
   }
   ```

### 문제: 의존성 충돌

**오류**:
```
npm ERR! ERESOLVE unable to resolve dependency tree
```

**해결책**:

1. **--legacy-peer-deps 사용**:
   ```bash
   npm install --legacy-peer-deps
   ```

2. **package.json 업데이트**:
   ```json
   {
     "overrides": {
       "problematic-package": "compatible-version"
     }
   }
   ```

3. **헌법 확인**:
   - 승인된 버전 목록이 있는가?
   - 이 의존성이 검토되었는가?

## 구조 검증 오류

### 문제: 필수 파일/디렉토리 누락

**출력**:
```
[WARN] specs/ directory is missing
[WARN] docs/ directory is missing
[ERROR] README.md is missing
```

**해결책 - 빠른 수정**:
```bash
# 프로젝트로 이동
cd your-project

# 누락된 디렉토리 생성
mkdir -p specs docs

# README 생성
touch README.md

# 헌법 파일 생성 (없는 경우)
touch constitution.md
```

## 문서화 문제

### 문제: 마크다운 파일의 링크가 깨짐

**문제점**: 마크다운의 파일 경로가 작동하지 않음.

**원인**: 상대 경로를 잘못 사용함.

**해결책**:

프로젝트 내 파일은 상대 경로 사용:
```markdown
[헌법](./constitution.md)
[SPEC](./specs/feature-name/SPEC.md)
[모범 사례](./docs/best-practices.md)
```

### 문제: Mermaid 다이어그램이 렌더링되지 않음

**원인**: 다이어그램의 구문 오류.

**해결책**:

1. **구문 검증**: [mermaid.live](https://mermaid.live)에서 확인

2. **특수 문자가 있는 레이블 인용**:
   ```mermaid
   graph LR
       A["사용자 (인증됨)"] --> B["API"]
   ```

3. **레이블에서 HTML 피하기**

## 추가 도움 받기

### 리소스

- **헌법 예시**: [constitution.md](../constitution.md)
- **시작하기**: [getting-started.md](./getting-started.md)
- **Spec-Kit 가이드**: [spec-kit-guide.md](./spec-kit-guide.md)
- **모범 사례**: [best-practices.md](./best-practices.md)

### 도움 요청하기

도움을 요청할 때 다음을 제공하세요:

1. **컨텍스트**:
   - 무엇을 하려고 했는가?
   - 어떤 명령을 실행했는가?

2. **오류 세부 사항**:
   - 전체 오류 메시지
   - 스택 트레이스 (해당되는 경우)

3. **환경**:
   - OS (Windows/macOS/Linux)
   - 사용 중인 언어/프레임워크 버전
   - Git 버전

4. **시도한 것**:
   - 시도한 해결책
   - 각 시도의 결과

**예시**:
```
새 프로젝트를 설정하려고 하는데 오류가 발생합니다.

명령:
mkdir -p src tests specs docs

오류:
Permission denied

환경:
- OS: Ubuntu 22.04
- Node: 18.17.0

시도한 것:
1. 프로젝트 루트에 있는지 확인 - 예
2. 쓰기 권한 확인 - 아니오 (여기서 문제 발견)

아이디어가 있으신가요?
```

---

**여전히 막혀 있나요?** 특정 오류에 대해 AI 코딩 어시스턴트에게 도움을 요청하세요!
