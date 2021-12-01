Write-Host '------------------------------' -ForegroundColor DarkGray
Write-Host '    Week Date Calculator      ' -ForegroundColor DarkGray
Write-Host '------------------------------' -ForegroundColor DarkGray

# Check whether user provided 2 parameters.
If ($args.Count -ne 2)
{
    $year = Read-Host -Prompt "Please provide a year"
    $day = Read-Host -Prompt "Please provide a date of first Monday"
}
Else
{
    $year = $args[0]
    $day = $args[1]
}

# Inform user about the filepath.
Write-Host 'Year:' $year -ForegroundColor Yellow
Write-Host '1st Monday:' $day'. 1.' $year -ForegroundColor Yellow

# Prepare date Monday variable.
$date = (Get-Date -Day $day -Month 1 -Year $year -Hour 0 -Minute 0 -Second 0)

# Results go here.
Write-Host
Write-Host 'Results:' -ForegroundColor Green

# Go in a loop until YEAR is still the same and print:
# week number, day of Monday and Friday, plus add some brackets.
$weekNumber = 1
while ($date.Year -eq $year) {
    Write-Host $weekNumber'. KT (' -NoNewline -ForegroundColor Green
    Write-Host $date.ToString("d.M.") - $date.AddDays(4).ToString("d.M.") -NoNewline -ForegroundColor Green
    Write-Host ')' -ForegroundColor Green
    
    $date = $date.AddDays(7);
    $weekNumber++;
}
