#!/bin/bash 

declare -A version
HTML=report.html

function rpmnames
{
  for rpm in `cat $* | sort -u` 
  do
    echo ${rpm%-*-*}
  done | sort -u
}

function readrpms
{
  for node in $*
  do
    while read rpm
    do
					# rpm is gnome-panel-2.16.1-7.el5
      rpmname=${rpm%-*-*}		# gnome-panel
      rpmnameversion=${rpm%-*}		# gnome-panel-2.16.1
      rpmversion=${rpmnameversion##*-}	# 2.16.1
      rpmrelease=${rpm##*-}		# 7.el5
      idx=${node}_${rpmname}
      if [ -z "${version[$idx]}" ]; then
        version[$idx]="${rpmversion}-${rpmrelease}"
      else
        version[$idx]="${version[$idx]} ${rpmversion}-${rpmrelease}"
      fi
    done < $node
  done
}

function showrpms
{
  for rpmname in `rpmnames $*`
  do
    idx=$1_${rpmname}
    template="${version[$idx]}"
    allsame=1
    for node in $*
    do
      idx=${node}_${rpmname}
      if [ "${version[$idx]}" != "${template}" ]; then
        allsame=0
        break
      fi
    done

    if [ $allsame -eq 1 ]; then
      echo "RPM MATCH: $rpmname $template"
      echo "<tr class=\"same\">" >> $HTML
    else
      echo "RPM $rpmname"
      echo "<tr class=\"notsame\">" >> $HTML
    fi
    echo "<th>${rpmname}</th>" >> $HTML
    for node in $*
    do
      idx=${node}_${rpmname}
      [ $allsame -eq 0 ] && echo "$node : ${version[$idx]:-Not Installed}"
      echo "<td>${version[$idx]:-NotInstalled}</td>" | \
          sed s/" "/"<br \/>"/g | \
          sed s/"NotInstalled"/"Not Installed"/g >> $HTML
    done
    echo "</tr>" >> $HTML
  done
}

function starthtml
{
  cat - <<-EOF > $HTML
	<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
        	"http://www.w3.org/TR/html4/loose.dtd">

	<html>
	<head>
	<meta http-equiv="Content-Type" content="text/html;charset=utf-8" >
	<title>Report on $*</title>
	<style type="text/css">
  	  tr.heading { background-color: #f2f2f2; font-size: 1.2em; }
  	  tr.same    { background-color: white; }
  	  tr.notsame { background-color: #c2c2c2; }
  	  td { font-family: sans-serif; font-size: 0.8em; }
  	  th { font-family: serif; font-size: 0.8em; }
	</style>
	</head>
	<body>
	<table border="1">
	<tr class="heading"><th>RPM</th>
EOF
  for node in $*
  do
    echo "<th>$node</th>" >> $HTML
  done
  echo "</tr>" >> $HTML
} 

function endhtml
{
  echo "<tr class=\"heading\"><th>RPM</th>" >> $HTML
  for node in $*
  do
    echo "<th>$node</th>" >> $HTML
  done
  echo "</tr></table>" >> $HTML
  echo "</body></html>"  >> $HTML
}

starthtml $*
readrpms $*
showrpms $*
endhtml $*
