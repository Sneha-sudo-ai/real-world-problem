@echo off
echo Setting local git user info
git config user.email "you@example.com"
git config user.name "Your Name"
echo Staging changes
git add -A
echo Committing changes
git commit -m "Save local work before pushing to Sneha repo" || echo No changes to commit
echo Done
