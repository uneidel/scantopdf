<<LICENSE
Copyright (c) 2015 uneidel


Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.

LICENSE

#!/bin/bash
DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )
BASEDIR=/tmp/
WKDIR=$BASEDIR"$RANDOM.$RANDOM"

if [ -d $WKDIR ]; then
echo "Folder Exists... Exiting"
exit 0
fi


mkdir $WKDIR
scanimage --resolution 300 -x 215 -y 280 --format=pnm --batch=$WKDIR/document-p00%d$
echo "processing..."
if [ "$1" == "merge" ]
then
 echo "merging...."
 nohup $DIR/merge.sh $WKDIR &
else
 nohup $DIR/process.sh $WKDIR &
fi

