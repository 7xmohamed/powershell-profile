$profilePath = $PROFILE.CurrentUserCurrentHost
$profileDir = Split-Path -Path $profilePath -Parent
$sourcePath = Join-Path -Path $PSScriptRoot -ChildPath 'Microsoft.PowerShell_profile.ps1'
$themePath = Join-Path -Path $PSScriptRoot -ChildPath 'cobalt2.omp.json'

if (-not (Test-Path -Path $sourcePath -PathType Leaf)) {
    throw "Profile source file not found: $sourcePath"
}

if (-not (Test-Path -Path $profileDir)) {
    New-Item -Path $profileDir -ItemType Directory -Force | Out-Null
}

Copy-Item -Path $sourcePath -Destination $profilePath -Force

if (Test-Path -Path $themePath -PathType Leaf) {
    Copy-Item -Path $themePath -Destination (Join-Path -Path $profileDir -ChildPath 'cobalt2.omp.json') -Force
}

