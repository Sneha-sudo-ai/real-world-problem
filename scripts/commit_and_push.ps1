Set-StrictMode -Version Latest
Write-Host "Running git operations in: $(Get-Location)"
Write-Host "Staging changes..."
git add -A
Write-Host "Committing (may say 'nothing to commit')..."
$commitOutput = & git commit -m "Save local work before pushing to Sneha repo" 2>&1
if ($LASTEXITCODE -eq 0) {
  Write-Host "Commit succeeded:"
  Write-Host $commitOutput
} else {
  Write-Host "Commit exited with code $LASTEXITCODE (may be 'nothing to commit' or an error)."
  Write-Host $commitOutput
}
Write-Host "Pushing to 'sneha' remote..."
$pushOutput = & git push -u sneha main 2>&1
if ($LASTEXITCODE -eq 0) {
  Write-Host "Push succeeded:"
  Write-Host $pushOutput
} else {
  Write-Host "Push failed with code $LASTEXITCODE"
  Write-Host $pushOutput
  exit $LASTEXITCODE
}
Write-Host "Done."