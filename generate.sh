#!/bin/bash

set -e

HTML_FILE="index.html"
CWD=$PWD

make_all()
{
    DIRS=$(ls -d */)

    for i in $DIRS
    do
	cd $CWD
	if [ -f $i/Makefile ]
	then
	    cd $i
	    make
	fi
    done  
}


generate_index_page()
{
    cd $CWD
    echo '<html><title>Talks</title>' > "$HTML_FILE"
    echo '<center><h2 style="color:red" >Lightning Talks</h2></center>' >> "$HTML_FILE"
    echo '<hr><h4><ul>' >> "$HTML_FILE"

    DIRS=$(ls -d */)
    
    for i in $DIRS
    do	
	if [ -f $i/slides.html ]
	then
	    name=$(echo $i | tr -d '/')
	    echo '<li><a href="'$name'/slides.html" target="_blank">'$name'</a></li>' >> "$HTML_FILE"
	fi
    done
    echo '</ul></h4></html>' >> "$HTML_FILE"
}

start_python_server()
{
    cd $CWD
    # git pull
    html_index_gen
    echo -e "\e[32mVisit: http://$(hostname):8000/ \e[0m"
    echo "[ctrl + c] to exit"
    python3 -m http.server $1 >/dev/null 2>&1
}

# Start

if [ "$1" == "open" ]
then
    if google-chrome --incognito index.html 2>1 >/dev/null
    then
        echo "Opening in Browser"
    else
        firefox --private-window index.html 2>1 >/dev/null
	    echo "Opening on Firefox."
    fi
    
elif [ "$1" == "serve" ]
then
    start_python_server
else
    make_all
    generate_index_page
fi


if [ "$?" == "143" ]
then
    echo "Python Server got killed"
fi
