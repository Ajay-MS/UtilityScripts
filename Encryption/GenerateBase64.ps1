$Text = ‘This is a secret and should be hidden’
$EncodedText =[Convert]::ToBase64String([System.Text.Encoding]::Unicode.GetBytes($Text))
$EncodedText
[System.Text.Encoding]::Unicode.GetString([System.Convert]::FromBase64String($EncodedText))
$DecodedText

 
