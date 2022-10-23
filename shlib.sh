################################################
#   Library of shell helpers and functions     #
################################################

# shellcheck shell=sh

# Test for the existence of a specified utility or utility option;
# Echo 1 on success, nothing on failure.
#
# $1 = the name of a utility or a utility option to test
#      for the existence of;
__exists(){
    found="$($@ 2>/dev/null 1>&2; echo $?)"
    if [ "$found" -eq 0 ];then
        echo 1
    fi
}

# Format a column of items (first column if multiple columns
# passed in the input) into a row of items separated by specified
# seaparator (default to whitespace).
#
# $1 = one or more columns of items
# $2 = separator to use for the result
#
# NOTES:
# the format specifier to awk is quoted in single quotation marks
# to avoid shell expansion; however, we DO want to expand the shell
# variable representing the separator so we take advantage of
# fact that, like C, the shell concatenates adjacent strings.
__column_to_list(){
    sep="${2:- }"
    echo "${1:?}" | awk 'BEGIN {ORS="'"$sep"'"} {print $1}'
}

