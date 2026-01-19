<#
.SYNOPSIS
    Initialize a new Spec-Kit based project.

.DESCRIPTION
    Creates a new project based on D:\project\base templates.
    - Copy Cursor IDE commands
    - Copy PowerShell scripts
    - Copy templates
    - Copy documentation
    - Generate project constitution
    - Initialize Git

.PARAMETER ProjectName
    Project name (required)

.PARAMETER TargetPath
    Target path for project creation (default: D:\project)

.PARAMETER IncludeSampleSpec
    Include sample spec file

.PARAMETER SkipGit
    Skip Git initialization

.EXAMPLE
    .\init-project.ps1 -ProjectName "my-app"
    
.EXAMPLE
    .\init-project.ps1 -ProjectName "my-app" -TargetPath "C:\workspace" -IncludeSampleSpec

.NOTES
    Author: Spec-Kit
    Version: 1.0.0
#>

param(
    [Parameter(Mandatory=$true, HelpMessage="Enter project name")]
    [ValidateNotNullOrEmpty()]
    [string]$ProjectName,
    
    [Parameter(Mandatory=$false)]
    [string]$TargetPath = "D:\project",
    
    [Parameter(Mandatory=$false)]
    [switch]$IncludeSampleSpec,
    
    [Parameter(Mandatory=$false)]
    [switch]$SkipGit
)

# Configuration
$ErrorActionPreference = "Stop"
$BasePath = $PSScriptRoot | Split-Path -Parent | Split-Path -Parent | Split-Path -Parent
$NewProjectPath = Join-Path $TargetPath $ProjectName

# Output functions
function Write-Step {
    param([string]$Message)
    Write-Host "[OK] $Message" -ForegroundColor Green
}

function Write-Info {
    param([string]$Message)
    Write-Host "[INFO] $Message" -ForegroundColor Cyan
}

function Write-Warn {
    param([string]$Message)
    Write-Host "[WARN] $Message" -ForegroundColor Yellow
}

# Start
Write-Host ""
Write-Host "=== Spec-Kit Project Initialization ===" -ForegroundColor Magenta
Write-Host "=" * 50 -ForegroundColor DarkGray
Write-Info "Base path: $BasePath"
Write-Info "Project name: $ProjectName"
Write-Info "Target path: $NewProjectPath"
Write-Host ""

# Check if project path exists
if (Test-Path $NewProjectPath) {
    Write-Warn "Path already exists: $NewProjectPath"
    $confirm = Read-Host "Overwrite? (y/N)"
    if ($confirm -ne 'y' -and $confirm -ne 'Y') {
        Write-Host "Operation cancelled." -ForegroundColor Red
        exit 1
    }
}

# 1. Create project directory
Write-Host "1. Creating project directory..." -ForegroundColor White
New-Item -ItemType Directory -Path $NewProjectPath -Force | Out-Null
New-Item -ItemType Directory -Path "$NewProjectPath\specs" -Force | Out-Null
Write-Step "Project directory created"

# 2. Copy .cursor/commands
Write-Host "2. Copying Cursor commands..." -ForegroundColor White
$CursorCommandsSource = Join-Path $BasePath "templates\project-template\.cursor\commands"
$CursorCommandsDest = Join-Path $NewProjectPath ".cursor\commands"
if (Test-Path $CursorCommandsSource) {
    New-Item -ItemType Directory -Path $CursorCommandsDest -Force | Out-Null
    Copy-Item -Path "$CursorCommandsSource\*" -Destination $CursorCommandsDest -Force
    Write-Step "Cursor commands copied"
} else {
    Write-Warn "Cursor commands source not found: $CursorCommandsSource"
}

# 3. Copy .claude/commands
Write-Host "3. Copying Claude commands..." -ForegroundColor White
$ClaudeCommandsSource = Join-Path $BasePath "templates\project-template\.claude\commands"
$ClaudeCommandsDest = Join-Path $NewProjectPath ".claude\commands"
if (Test-Path $ClaudeCommandsSource) {
    New-Item -ItemType Directory -Path $ClaudeCommandsDest -Force | Out-Null
    Copy-Item -Path "$ClaudeCommandsSource\*" -Destination $ClaudeCommandsDest -Force
    Write-Step "Claude commands copied"
} else {
    Write-Warn "Claude commands source not found: $ClaudeCommandsSource"
}

# 4. Copy .specify
Write-Host "4. Copying Spec-Kit settings..." -ForegroundColor White
$SpecifySource = Join-Path $BasePath ".specify"
$SpecifyDest = Join-Path $NewProjectPath ".specify"
if (Test-Path $SpecifySource) {
    Copy-Item -Path $SpecifySource -Destination $SpecifyDest -Recurse -Force
    Write-Step "Spec-Kit settings copied"
} else {
    Write-Warn "Spec-Kit settings not found: $SpecifySource"
}

# 5. Copy docs
Write-Host "5. Copying documentation..." -ForegroundColor White
$DocsSource = Join-Path $BasePath "docs"
$DocsDest = Join-Path $NewProjectPath "docs"
if (Test-Path $DocsSource) {
    Copy-Item -Path $DocsSource -Destination $DocsDest -Recurse -Force
    Write-Step "Documentation copied"
} else {
    Write-Warn "Documentation not found: $DocsSource"
}

# 6. Generate project constitution
Write-Host "6. Generating project constitution..." -ForegroundColor White
$ConstitutionTemplate = Join-Path $BasePath ".specify\templates\project-constitution-template.md"
$ProjectConstitution = Join-Path $NewProjectPath "constitution.md"

if (Test-Path $ConstitutionTemplate) {
    $ConstitutionContent = Get-Content $ConstitutionTemplate -Raw -Encoding UTF8
    $ConstitutionContent = $ConstitutionContent -replace '\{\{PROJECT_NAME\}\}', $ProjectName
    $ConstitutionContent = $ConstitutionContent -replace '\{\{DATE\}\}', (Get-Date -Format "yyyy-MM-dd")
    $ConstitutionContent = $ConstitutionContent -replace '\{\{BASE_PATH\}\}', $BasePath
    Set-Content -Path $ProjectConstitution -Value $ConstitutionContent -Encoding UTF8
    Write-Step "Project constitution generated"
} else {
    # Create default constitution if template not found
    $DefaultConstitution = @"
# $ProjectName Project Constitution

> Created: $(Get-Date -Format "yyyy-MM-dd")
> Based on: $BasePath (Spec-Kit)

## Project Overview

### Purpose
[Describe the main purpose of this project]

### Technology Stack
- **Language**: 
- **Framework**: 
- **Database**: 
- **Deployment**: 

---

## Spec-Kit Workflow

### Feature Development Process
1. ``/speckit.specify`` - Write specification
2. ``/speckit.plan`` - Create implementation plan
3. ``/speckit.tasks`` - Break down tasks
4. ``/speckit.implement`` - Implement

### Branch Strategy
- Feature branch: ``feature/SPEC-XXX-description``
- Bug fix: ``fix/SPEC-XXX-description``

---

## References

- Spec-Kit Guide: ``docs/spec-kit-guide.md``
- Best Practices: ``docs/best-practices.md``
"@
    Set-Content -Path $ProjectConstitution -Value $DefaultConstitution -Encoding UTF8
    Write-Step "Default project constitution generated"
}

# 7. Copy .gitignore
Write-Host "7. Copying .gitignore..." -ForegroundColor White
$GitignoreSource = Join-Path $BasePath ".gitignore"
$GitignoreDest = Join-Path $NewProjectPath ".gitignore"
if (Test-Path $GitignoreSource) {
    Copy-Item -Path $GitignoreSource -Destination $GitignoreDest -Force
    Write-Step ".gitignore copied"
} else {
    # Create default .gitignore
    $DefaultGitignore = @"
# Dependencies
node_modules/
vendor/
.venv/
__pycache__/

# Build
dist/
build/
*.egg-info/

# IDE
.idea/
.vscode/
*.swp
*.swo

# OS
.DS_Store
Thumbs.db

# Logs
*.log
logs/

# Environment
.env
.env.local
"@
    Set-Content -Path $GitignoreDest -Value $DefaultGitignore -Encoding UTF8
    Write-Step "Default .gitignore created"
}

# 8. Create sample spec (optional)
if ($IncludeSampleSpec) {
    Write-Host "8. Creating sample spec..." -ForegroundColor White
    $SpecTemplate = Join-Path $BasePath ".specify\templates\spec-template.md"
    $SampleSpec = Join-Path $NewProjectPath "specs\001-sample-feature.spec.md"
    if (Test-Path $SpecTemplate) {
        Copy-Item -Path $SpecTemplate -Destination $SampleSpec -Force
        Write-Step "Sample spec created"
    }
}

# 9. Initialize Git
if (-not $SkipGit) {
    Write-Host "9. Initializing Git repository..." -ForegroundColor White
    Push-Location $NewProjectPath
    try {
        git init 2>$null
        git add . 2>$null
        git commit -m "Initial commit: Spec-Kit project setup" 2>$null
        Write-Step "Git repository initialized"
    } catch {
        Write-Warn "Git initialization failed (check if Git is installed)"
    }
    Pop-Location
}

# Completion message
Write-Host ""
Write-Host "=" * 50 -ForegroundColor DarkGray
Write-Host "Project '$ProjectName' created successfully!" -ForegroundColor Yellow
Write-Host ""
Write-Info "Location: $NewProjectPath"
Write-Host ""
Write-Host "Next steps:" -ForegroundColor Cyan
Write-Host "  1. Open project in Cursor:" -ForegroundColor White
Write-Host "     cursor `"$NewProjectPath`"" -ForegroundColor Gray
Write-Host ""
Write-Host "  2. Review and customize constitution.md" -ForegroundColor White
Write-Host ""
Write-Host "  3. Create your first spec with /speckit.specify" -ForegroundColor White
Write-Host ""
