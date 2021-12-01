Write-Host '------------------------------' -ForegroundColor DarkGray
Write-Host '    Week Date Calculator      ' -ForegroundColor DarkGray
Write-Host '------------------------------' -ForegroundColor DarkGray


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

Write-Host
Write-Host 'Results:' -ForegroundColor Green

$date = (Get-Date -Day $day -Month 1 -Year $year -Hour 0 -Minute 0 -Second 0)

$weekNumber = 1
while ($date.Year -eq $year) {
    Write-Host $weekNumber'. KT (' -NoNewline -ForegroundColor Green
    Write-Host $date.ToString("d.M.") - $date.AddDays(4).ToString("d.M.") -NoNewline -ForegroundColor Green
    Write-Host ')' -ForegroundColor Green
    
    $date = $date.AddDays(7);
    $weekNumber++;
}
