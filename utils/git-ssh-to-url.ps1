# Input SSH URL
$ssh_url = "git@github.com:hychan48/pull-request-tut.git"

# Extract username and repository name using regular expression
$regex = "^git@github.com:(.*)/(.*).git$"
if ($ssh_url -match $regex) {
    $username = $matches[1]
    $repository = $matches[2]
    
    # Convert to HTTPS URL
    $https_url = "https://github.com/$username/$repository"
    
    Write-Output $https_url

    # validate todo extract
    $EXPECTED_HTTPS_URL = "https://github.com/hychan48/pull-request-tut"
    if ($https_url -eq $EXPECTED_HTTPS_URL) {
        Write-Output "Test passed"
    } else {
        Write-Output "Test failed"
    }

}
