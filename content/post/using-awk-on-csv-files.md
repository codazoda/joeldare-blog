---
date: "2015-07-28"
title: "Using Awk on CSV Files"
lastmod: "2017-04-18"
tags: ["tech","awk"]
---

You can use AWK to quickly look at a column of data in a CSV file.

In my case, the CSV files are in the following format:

    "field1","field2","field3"

To view the 3rd field of every line, you can use the following command.

    awk -F "\"*,\"*" '{print $3}' file.csv

As another example, take the following pipe delimited format:

    field1|field2|field3

To view the 2nd field of every line, you can use the following command.

    awk -F "|" '{print $2}' file.csv

You can also pull multiple columns with one command.  The following example pulls the 3rd column and then the 1st column.

    awk -F "\"*,\"*" '{print $3,$1}' file.csv

If you separate the arguments with a comma (as in the example above) they will be concatenated with space between the items.  You can also use a space (as in the example below) and the items will have no space between them.

    awk -F "\"*,\"*" '{print $3 $1}' file.csv

If you wanted to add a separator between those columns, you can add some text in quotes and it will be output as-is.  In the example below, I'll add a pipe (|) character between the two columns.

    awk -F "\"*,\"*" '{print $3 "|" $1}' file.csv

## Unmatched Error

If you get an error about an unmatched comma, you are probably trying to run this in a csh shell instead of a bash shell. These shells behave a little differently. Here's the error you'll get.

    'Unmatched ".'

One solution is to run this command from bash. To switch to a bash shell, just run the /bash/ command to switch to a bash shell.

    bash

Special thanks to Marina for reporting this error.

## In an Awk File

You can also put your awk options inside of an awk script. Here's some example output for doing that.

Here's my original file, test.csv.

    a1,b1,c1
    a2,b2,c2
    a3,b3,c3

Here's my awk script, test.awk.

    BEGIN {FS = ","}
    {print $1,$3}

The "BEGIN" keyword tells awk to process this command before it processes the file.  FS is the field separator, we've set it to a comma.

Now I just run both through awk like this:

    awk -f test.awk test.csv

Or like this (if you were using cat, which isn't necessary):

    cat test.csv | awk -f test.awk

Here's the final result:

    a1 c1
    a2 c2
    a3 c3

Here's an even bigger example awk script, but I won't explain this in detail.

    BEGIN {
      FS = ",";
    }
    {
      total = $2 + $3;
      print $1,$2,$3,total;
    }
    END {

    }

## Links

[[http://www.staff.science.uu.nl/~oostr102/docs/nawk/nawk_toc.html|The Awk Manual]]

[[http://www.thegeekstuff.com/2010/01/awk-tutorial-understand-awk-variables-with-3-practical-examples/|Awk Tutorial: Understand Awk Variables with 3 Practical Examples]]
