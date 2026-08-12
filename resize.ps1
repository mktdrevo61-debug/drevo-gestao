Add-Type -AssemblyName System.Drawing
$img = [System.Drawing.Image]::FromFile('C:\Mkt-Apps\seo-brain\APP_PRODUCAO\favicon.png')

function ResizeAndPad($size, $out) {
    $bmp = New-Object System.Drawing.Bitmap $size, $size
    $g = [System.Drawing.Graphics]::FromImage($bmp)
    $g.Clear([System.Drawing.Color]::White)
    
    $ratio = [math]::Min($size / $img.Width, $size / $img.Height)
    $newW = [math]::Round($img.Width * $ratio)
    $newH = [math]::Round($img.Height * $ratio)
    $x = [math]::Round(($size - $newW) / 2)
    $y = [math]::Round(($size - $newH) / 2)
    
    $g.DrawImage($img, $x, $y, $newW, $newH)
    $bmp.Save($out, [System.Drawing.Imaging.ImageFormat]::Png)
    $g.Dispose()
    $bmp.Dispose()
}

ResizeAndPad 192 'C:\Mkt-Apps\seo-brain\APP_PRODUCAO\icon-192.png'
ResizeAndPad 512 'C:\Mkt-Apps\seo-brain\APP_PRODUCAO\icon-512.png'
$img.Dispose()
