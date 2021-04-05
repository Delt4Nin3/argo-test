$files = gci -r -fi *.unsealed.yaml

foreach ($file in $files)
{
    $outFile = $file.fullname.replace(".unsealed", "")
    # call yq eval $file.fullname | kubeseal | yq eval -P  
    yq eval $file.fullname | kubeseal | yq eval -P > $outFile
}
