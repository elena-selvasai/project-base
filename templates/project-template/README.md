# [Project Name]

> Brief description of your project

## Overview

[Provide a comprehensive overview of what this project does, its purpose, and main features]

## Features

- Feature 1
- Feature 2
- Feature 3

## Requirements

- Technology requirement 1 (e.g., Node.js 18+)
- Technology requirement 2
- Technology requirement 3

## Installation

```bash
# Clone the repository
git clone [repository-url]

# Navigate to project directory
cd [project-name]

# Install dependencies
npm install  # or yarn install, pip install -r requirements.txt, etc.
```

## Usage

```bash
# Run the project
npm start  # or your project's start command
```

### Examples

[Provide usage examples]

## Project Structure

```
[project-name]/
├── .cursor/
│   └── commands/           # Cursor IDE 커맨드
│       ├── speckit.specify.md
│       ├── speckit.plan.md
│       ├── speckit.tasks.md
│       ├── speckit.implement.md
│       └── ...
├── .claude/
│   └── commands/           # Claude Code 커맨드
│       ├── speckit.specify.md
│       ├── speckit.plan.md
│       ├── speckit.tasks.md
│       ├── speckit.implement.md
│       └── ...
├── src/                    # Source code
├── tests/                  # Tests
├── specs/                  # Feature specifications
├── docs/                   # Documentation
├── constitution.md         # Project constitution
├── CLAUDE.md               # Claude Code context
└── README.md               # This file
```

## Development

### Running Tests

```bash
npm test  # or your test command
```

### Building

```bash
npm run build  # or your build command
```

## Spec-Driven Development

This project follows the Spec-Kit methodology. 

### 사용 가능한 커맨드

이 프로젝트는 Spec-Kit 방법론을 따릅니다. 

**주요 워크플로우**: `/speckit.specify` → `/speckit.plan` → `/speckit.tasks` → `/speckit.implement`

전체 커맨드 목록은 프로젝트의 Spec-Kit 문서를 참조하세요.

### 새 기능 추가하기

1. `/speckit.specify [기능 설명]` - SPEC.md 생성
2. `/speckit.clarify` - 불명확한 부분 명확화
3. `/speckit.plan` - PLAN.md 생성
4. `/speckit.tasks` - tasks.md 생성
5. `/speckit.implement` - 구현 실행

## Contributing

Please refer to the project [constitution.md](./constitution.md) for coding standards and guidelines.

1. Create a feature specification in `specs/`
2. Get approval for the specification
3. Implement following the plan
4. Write tests
5. Submit for review

## License

[Specify your license]

## Contact

[Your contact information or team contact]

---

Last Updated: [Date]
