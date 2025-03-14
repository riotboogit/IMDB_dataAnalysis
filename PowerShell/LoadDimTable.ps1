#inserts subset of csv file into DB table
#connect to sql server box 
#dev sql


try {
    
    $strConn = “Server=XXX-SQL-XXX\Applications;Integrated Security=true;Initial Catalog=UtilityDB” 
    $inFile = "C:\work\school\PivotTables\Ex_Files_PivotTables_Part_1_Mastering\Exercise Files\2016.csv"
    
  #Import Dim Table
  #sub set of columns from csv file
    $file = Get-Item $inFile
    $size = $file.Length 
    $strSize = $size.ToString()
    Write-Host 'File Size' $strSize
    #-- used as fields for table insert 
    $Title
    $Release
    $Color
    $Genre
    $Language
    $Country
    $Rating
    $LeadActor
    $Director
    

    $runDate = Get-Date
    $fileDate = $runDate.ToString("yyyy-MM-dd")
    $fileDate = $fileDate -replace "-", ""
    
    #dbconnection
    $sqlConn = New-Object System.Data.SqlClient.SqlConnection
    $sqlConn.ConnectionString = $strConn
    $sqlConn.Open()
    Write-Warning "db connected"

    #clear old table 
    $sqlcmd = $sqlConn.CreateCommand()
    <# or #>
    $sqlCmd = New-Object System.Data.SqlClient.SqlCommand
    $sqlCmd.Connection = $sqlConn
    $query = “TRUNCATE TABLE dbo.Dim_Test_2016”
    $sqlCmd.CommandText = $query
    $sqlCmd.ExecuteNonQuery()
    Write-Warning "table truncated"

    #only process if there is data 
    If ($size -gt 0) {
    #import GIS File
    $csvRows = Import-Csv -Path $inFile 
    foreach($row in $csvRows) {
        $Title = $row.'Title'
        #replace sporadic double quotes in movie titles
        $Title = $Title -replace '"',''
        #add escape to any apostrophes in titles
        $Title = $Title -replace "'","''''"
        $Release= $row.'Release Date'
        $Color = $row.'Color/B&W'
        $Genre = $row.'Genre'
        $Language = $row.'Language'
        $Country = $row.'Country'
        $Rating = $row.'Rating'
        $LeadActor = $row.'Lead Actor'
        #damn you ryan o'neal
        $LeadActor = $LeadActor -replace "'","''''"
        $Director = $row.'Director Name'
        $Director = $Director -replace "'","''''"

        $query = “Insert into dbo.Dim_Test_2016 values ('$Title','$Release','$Color','$Genre','$Language','$Country','$Rating','$LeadActor','$Director')”
        $msg = "Query: " + $query
        Write-Warning $msg
        $sqlCmd.CommandText = $query
        $sqlCmd.ExecuteNonQuery()
    }
    Write-Warning "table loaded"
    }
    else {
        Write-Warning "no data to load"
    }
} # end try 
catch {
    Write-warning "something went wrong"
}
finally{

    $sqlConn.Close()
}


Write-warning "complete"
