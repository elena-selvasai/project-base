# [Project Name] Constitution

> This document defines project-specific guidelines that extend or customize the Spec-Kit methodology.

## Inheritance

This project follows the Spec-Kit methodology principles. Add project-specific guidelines below.

## Project-Specific Principles

### 1. Debugging Loop Prevention
- 디버깅 과정에서 원인 분석이 되지 않거나 반복적으로 수정을 시도하는 경우, 작업을 즉시 중단합니다.
- 현재 상황을 정리하여 사용자에게 보고하고 가이드를 요청합니다.

### 2. Execution Verification and Error Handling
- 개발 완료 후 반드시 프로그램을 실행하여 정상 동작 여부를 확인해야 합니다.
- 실행 오류 발생 시 수정을 시도하되, 수정이 어렵거나 반복 오류 발생 시 즉시 중단하고 사용자에게 보고합니다.

### 3. [Principle Name]
[Description of the principle]

## Technology Stack

### Core Technologies
- [Technology 1]: [Version] - [Purpose]
- [Technology 2]: [Version] - [Purpose]

### Development Dependencies
- [Tool 1]: [Purpose]
- [Tool 2]: [Purpose]

## Architecture

### High-Level Architecture
[Describe your architecture - monolith, microservices, etc.]

### Design Patterns
- [Pattern 1]: [Where and why it's used]
- [Pattern 2]: [Where and why it's used]

### Data Flow
[Describe how data flows through your system]

## Coding Standards (Project-Specific)

### File Organization
```
src/
  ├── [module-1]/
  ├── [module-2]/
  └── index.js
```

### Naming Conventions (if different from global)
[Any project-specific naming conventions]

### Module Structure
[Expected structure for modules in this project]

## Testing Strategy (Project-Specific)

### Test Categories
- **Unit Tests**: [Specific requirements]
- **Integration Tests**: [Specific requirements]
- **E2E Tests**: [Specific requirements]

### Testing Tools
- [Tool 1]: [Purpose]
- [Tool 2]: [Purpose]

### Coverage Requirements
- Overall: [X]%
- Critical paths: [Y]%

## Development Workflow

### Branch Naming
```
feature/ABC-123-short-description
fix/ABC-124-bug-description
docs/ABC-125-doc-update
```

### Commit Messages
[Any project-specific commit message formats]

## Deployment

### Environments
- Development: [Details]
- Staging: [Details]
- Production: [Details]

### Deployment Process
1. [Step 1]
2. [Step 2]
3. [Step 3]

## Performance Requirements

### Response Times
- API endpoints: < [X]ms
- Page load: < [Y]s

### Scalability
[Scalability requirements and considerations]

## Security (Project-Specific)

### Authentication
[Authentication mechanism used]

### Authorization
[Authorization approach]

### Data Protection
[Project-specific data protection requirements]

## Dependencies Management

### Dependency Updates
- Security patches: Immediate
- Minor versions: [Frequency]
- Major versions: [Process]

### Approved Libraries
[List of approved third-party libraries or criteria for approval]

## Monitoring & Logging

### Logging Standards
- Log levels: [When to use each level]
- Sensitive data: [What not to log]

### Metrics
[Key metrics to track]

## Documentation Requirements

### Code Documentation
[Project-specific documentation requirements]

### API Documentation
[API documentation standards - OpenAPI, etc.]

## Team Practices

### Code Review
- Minimum reviewers: [N]
- Review checklist: [Link or list]

### Pair Programming
[When and how to use pair programming]

### Knowledge Sharing
[Team knowledge sharing practices]

## Special Considerations

### [Consideration 1]
[Details]

### [Consideration 2]
[Details]

---

**Last Updated**: [Date]
**Version**: 1.0.0
**Maintained by**: [Team/Person]
