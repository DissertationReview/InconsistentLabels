$datasets = @("zeppelin","shiro","maven","flume","mahout")

foreach($project in $datasets)
{
    write-host "now doing $($project)"

    $file = Get-Content "D:\workspace\mixed-workspace\mySZZ\matching_bugid_fixingsha\$($project)_bug_commit_all.txt"
    #$commitid = "3d9a83dc6c7677f2a273af1b87fdfb352991b41c"
    foreach($commitid in $file){
        $array = $commitid.Split(" ")
        $commitsha_pre = $array[1]
        #$logPath = "git_show_bugFixingCommitsID\$($project)\$($project)_$($commitid.Substring($commitid.LastIndexOf(" ")+1)).txt"
        $logPath = "git_show_bugFixingCommitsID\$($project)\$($project)_$($commitsha_pre).txt"

        #write-host "$commitsha_pre"
        #write-host "$logPath"

    	if( !(Test-Path $logPath ))
    	{
    		write-host "write $($project) show.txt"
    		cd D:\workspace\mixed-workspace\mySZZ\GitRepository\$project
		git show $commitsha_pre > D:\workspace\mixed-workspace\mySZZ\$($logPath)
		#git show $commitid.Substring($commitid.LastIndexOf(" ")+1) > D:\workspace\mixed-workspace\mySZZ\$($logPath)
    	}
    } 
    #break
}
cd D:\workspace\mixed-workspace\mySZZ\git_show_bugFixingCommitsID
write-host "End..."