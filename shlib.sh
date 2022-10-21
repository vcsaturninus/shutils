################################################
#   Library of shell helpers and functions     #
################################################

# shellcheck shell=sh

# $1
#   the name of a utility or a utility option to test
#   for the existence of;
#
# echoes true on success, nothing on failure
__exists(){
    found="$($@ 2>/dev/null 1>&2; echo $?)"
    if [ "$found" -eq 0 ];then
        echo 1 
    fi
}

# $1 = a column of items
# $2 = separator to use for the result
# 
# returns the items on a single separated by separator.
#
# NOTES:
# the format specifier to awk is quoted in single quotation marks
# to avoid shell expansion; however, we DO want to expand the
# seaparator so we take advantage of the fact that, like C, the 
# shell concatenates adjacent strings.
__column_to_list(){
    echo "${1:?}" | awk 'BEGIN {ORS="'"${2:?}"'"} {print $1}'
}

